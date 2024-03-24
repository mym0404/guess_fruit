import 'package:flutter/cupertino.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../export.dart';
import '../../../core/hook/use_mount.dart';
import '../../../core/widget/background.dart';
import '../../data/schema/chat_schema.dart';

final ai = Gemini.instance;

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStarted = useState(false);
    final chats = useState(<ChatSchema>[]);
    final isGenerating = useState(false);
    final scroller = useScrollController();

    void scrollToEnd() {
      doOnLayout(() {
        scroller.animateTo(scroller.position.maxScrollExtent,
            duration: 500.ms, curve: Curves.easeOut);
      });
    }

    void reset() {
      isStarted.value = false;
      chats.value = [];
      isGenerating.value = false;
    }

    void handleError(bool isLastChatExist) {
      final errorChat = ChatSchema(
          created: DateTime.now(),
          content: 'Unknown Error Occured',
          isFromUser: false,
          isError: true);
      if (isLastChatExist) {
        chats.value = [
          ...chats.value.sublist(0, chats.value.length - 1),
          errorChat,
        ];
      } else {
        chats.value = [
          ...chats.value,
          errorChat,
        ];
      }
    }

    final subscription = useRef<StreamSubscription<dynamic>?>(null);

    void onSubmitted(String text) {
      isStarted.value = true;
      isGenerating.value = true;

      chats.value = [
        ...chats.value,
        ChatSchema(
          created: DateTime.now(),
          content: text,
          isFromUser: true,
        )
      ];
      scrollToEnd();

      subscription.value?.cancel();
      subscription.value = ai
          .streamChat(chats.value
              .map(
                (e) => Content(parts: [Parts(text: e.content)], role: e.role),
              )
              .toList())
          .listen(
        (event) {
          var isLastChatExist =
              chats.value.isNotEmpty && !chats.value.last.isFromUser;
          if (event.output?.isNotEmpty == true) {
            if (isLastChatExist) {
              chats.value = [
                ...chats.value.sublist(0, chats.value.length - 1),
                chats.value.last.copyWith(
                    content: chats.value.last.content + (event.output ?? '')),
              ];
            } else {
              chats.value = [
                ...chats.value,
                ChatSchema(
                    created: DateTime.now(),
                    content: (event.output ?? ''),
                    isFromUser: false)
              ];
            }
          } else {
            handleError(isLastChatExist);
          }
          scrollToEnd();
        },
        onDone: () {
          isGenerating.value = false;
          scrollToEnd();
        },
        onError: (dynamic e) {
          handleError(chats.value.isNotEmpty && !chats.value.last.isFromUser);
          isGenerating.value = false;
          log.e('Error', error: e);
        },
      );
    }

    useUnmount(() {
      subscription.value?.cancel();
    });

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Background(),
          ),
          if (!isStarted.value)
            PosCenter(
              child: Pb(
                120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.lightbulbOnOutline, size: 64),
                    const Gap(16),
                    Text('Ask AI Anything', style: TS.h1.bold),
                    const Gap(8),
                    Text(
                      '''
"Write a bedtime story for a 6 year old boy who likes football"
                      ''',
                      textAlign: TextAlign.center,
                      style: TS.c(C.sub1),
                    ),
                  ],
                ),
              ),
            )
          else
            ListView.separated(
              itemCount: chats.value.length + (isGenerating.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == chats.value.length) {
                  return Center(
                    child: ShaderMask(
                      child: const CupertinoActivityIndicator(),
                      shaderCallback: (bounds) {
                        return LinearGradient(colors: [C.red400, C.blue400])
                            .createShader(bounds);
                      },
                    ),
                  );
                } else {
                  final chat = chats.value[index];

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: chat.isFromUser
                            ? Assets.images.logo.image()
                            : Icon(
                                MdiIcons.robot,
                                size: 32,
                              ),
                      ),
                      const Gap(20),
                      Expanded(
                          child: Pt(
                        6,
                        child: chat.isError
                            ? Column(
                                children: [
                                  Text(
                                    chat.content,
                                    style: TS.c(C.error),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        reset();
                                      },
                                      child: const Text('Reset')),
                                ],
                              )
                            : MarkdownBody(
                                selectable: true,
                                data: chat.content,
                              ),
                      ))
                    ],
                  );
                }
              },
              separatorBuilder: (context, index) => const Gap(16),
              controller: scroller,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 24, bottom: 120),
            ),
          PosBottom(
            child: IgnorePointer(
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      C.transparent,
                      Color(0xFF1b212b),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 1],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: BottomPanel(
              onSubmitted: onSubmitted,
              readOnly: isGenerating.value,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPanel extends HookConsumerWidget {
  const BottomPanel({
    super.key,
    required this.onSubmitted,
    required this.readOnly,
  });

  final void Function(String) onSubmitted;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useTextEditingController();
    final focusNode = useFocusNode();
    final isFocused = useState(false);

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
    });

    void submit() {
      if (readOnly) {
        return;
      }
      onSubmitted(text.text);
      text.text = '';
      focusNode.requestFocus();
    }

    return AnimatedContainer(
      duration: 300.ms,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: 8.radius,
        gradient: LinearGradient(
          colors: [
            !focusNode.hasFocus ? C.grey300 : C.primary,
            !focusNode.hasFocus ? C.grey500 : C.error
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: 8.radius,
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(color: C.surface),
          child: Stack(
            children: [
              Px(
                8,
                child: TextField(
                  readOnly: readOnly,
                  controller: text,
                  onSubmitted: (_) => submit(),
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      focusColor: Colors.red,
                      hintText: 'Ask AI anything...'),
                  cursorColor: C.text,
                  style: TS.b3,
                ),
              ),
              PosRight(
                right: 12,
                child: ValueListenableBuilder(
                  valueListenable: text,
                  builder: (context, newText, _) {
                    return IconButton(
                      icon: Icon(
                          readOnly ? MdiIcons.circle : MdiIcons.sendOutline,
                          size: 16),
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: newText.text.isNotEmpty ? submit : null,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
