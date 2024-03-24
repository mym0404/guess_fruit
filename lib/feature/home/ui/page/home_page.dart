import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/theme_map.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../export.dart';
import '../../../../main.dart';
import '../../../core/hook/use_mount.dart';
import '../../../core/util/chat_limit_util.dart';
import '../../../core/widget/background.dart';
import '../../data/schema/chat_schema.dart';

final ai = Gemini.instance;

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isStarted = useState(false);
    final chats = useState(<ChatSchema>[]);
    final isGenerating = useState(false);
    final scroller = useScrollController();
    final generateViewKey = useRef(GlobalKey());

    void scrollToEnd() {
      doOnLayout(() {
        scroller.animateTo(scroller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      });
    }

    void reset() {
      isStarted.value = false;
      chats.value = [];
      isGenerating.value = false;
      Gemini.reInitialize(
          apiKey: (dotenv.env['GEMINI_KEY'] ?? ''),
          safetySettings: safetySettings);
    }

    void handleError() {
      final errorChat = ChatSchema(
          created: DateTime.now(),
          content: 'Unknown Error Occured',
          isFromUser: false,
          isError: true);
      chats.value = [
        ...chats.value.sublist(0, chats.value.length - 1),
        errorChat,
      ];
    }

    final subscription = useRef<StreamSubscription<dynamic>?>(null);

    void onSubmitted(String text) async {
      if (!(await trySubmitAndCheckLimit())) {
        if (context.mounted) {
          context.showErrorSnackBar(
              text: 'Your chat API usage limit has been exceeded.');
        }
        return;
      }
      if (text.isEmpty) {
        return;
      }

      isStarted.value = true;
      isGenerating.value = true;

      chats.value = [
        ...chats.value,
        ChatSchema(
          created: DateTime.now(),
          content: text,
          isFromUser: true,
        ),
        ChatSchema(
          created: DateTime.now().add(const Duration(milliseconds: 1)),
          content: '',
          isFromUser: false,
        ),
      ];
      scrollToEnd();

      subscription.value?.cancel();
      subscription.value = ai
          .streamChat(chats.value
              .whereNotIndexed((index, element) =>
                  index == chats.value.length - 1 && !element.isFromUser)
              .map(
                (e) => Content(parts: [Parts(text: e.content)], role: e.role),
              )
              .toList())
          .listen(
        (event) {
          if (event.output?.isNotEmpty == true) {
            chats.value = [
              ...chats.value.sublist(0, chats.value.length - 1),
              chats.value.last.copyWith(
                  content: chats.value.last.content + (event.output ?? '')),
            ];
          } else {
            handleError();
          }
          scrollToEnd();
        },
        onDone: () {
          isGenerating.value = false;
          scrollToEnd();
        },
        onError: (dynamic e) {
          handleError();
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
              itemCount: chats.value.length,
              itemBuilder: (context, index) {
                var isLastItem = index == chats.value.length - 1;

                return Column(
                  key: ValueKey(index),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isLastItem)
                      GeminiResponseTypeView(
                        key: generateViewKey.value,
                        builder: (context, child, response, loading) {
                          doOnLayout(() {
                            scrollToEnd();
                          });
                          return ChatItem(
                            item: chats.value[index]
                                .copyWith(content: response ?? ''),
                            onReset: reset,
                          );
                        },
                      )
                    else
                      ChatItem(
                        item: chats.value[index],
                        onReset: reset,
                      ),
                    if (isLastItem && isGenerating.value)
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: ShaderMask(
                          child: const CupertinoActivityIndicator(),
                          shaderCallback: (bounds) {
                            return LinearGradient(colors: [C.red400, C.blue400])
                                .createShader(bounds);
                          },
                        ),
                      ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Gap(16),
              controller: scroller,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 24, bottom: 140),
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
            bottom: 16,
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

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required ChatSchema item,
    required this.onReset,
  }) : chat = item;

  final ChatSchema chat;
  final VC onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: ValueKey(chat.created),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: C.black,
            child: chat.isFromUser
                ? Assets.images.logo.image()
                : Icon(
                    MdiIcons.robot,
                    size: 20,
                  ),
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
                          onReset();
                        },
                        child: const Text('Reset')),
                  ],
                )
              : FullW(
                  child: MarkdownBody(
                    selectable: true,
                    data: chat.content ?? '',
                    fitContent: true,
                    shrinkWrap: true,
                    onTapLink: (text, href, title) async {
                      if (href == null) return;
                      final uri = Uri.parse(href);
                      if (await canLaunchUrl(uri)) launchUrl(uri);
                    },
                    builders: {
                      'code': HighlightBuilder(),
                    },
                    styleSheet: MarkdownStyleSheet(
                        codeblockDecoration: const BoxDecoration()),
                  ),
                ),
        ))
      ],
    );
  }
}

class HighlightBuilder extends MarkdownElementBuilder {
  HighlightBuilder();

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final textStyle = GoogleFonts.ubuntuMono(
      backgroundColor: Colors.transparent,
      fontWeight: FontWeight.w400,
    );

    var language = 'java';
    final pattern = RegExp(r'^language-(.+)$');
    if (element.attributes['class'] != null &&
        pattern.hasMatch(element.attributes['class']!)) {
      language =
          pattern.firstMatch(element.attributes['class']!)!.group(1) ?? 'java';
    }

    bool isInline = element.attributes['class'] == null;

    if (isInline) {
      return Text(element.textContent);
    }

    return HighlightView(
      element.textContent.trim(),
      language: language,
      theme: themeMap['dracula']!,
      padding: isInline
          ? const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 6,
            )
          : const EdgeInsets.all(12),
      textStyle: textStyle,
    );
  }
}

class BottomPanel extends HookWidget {
  const BottomPanel({
    super.key,
    required this.onSubmitted,
    required this.readOnly,
  });

  final void Function(String) onSubmitted;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
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
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                          onPressed: newText.text.isNotEmpty ? submit : null,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Gap(12),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {
                launchUrlString('https://github.com/mym0404/guess_fruit');
              },
              label: const Text('Github'),
              icon: Icon(MdiIcons.github, size: 16),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(C.white)),
            ),
            const Gap(0),
            TextButton(
              onPressed: () {
                launchUrlString('https://mjstudio.net');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(C.white),
              ),
              child: Text('© ${DateTime.now().year} MJ Studio'),
            ),
          ],
        ),
      ],
    );
  }
}
