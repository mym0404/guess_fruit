part of '../page/home_page.dart';

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
                : MarkdownBody(
                    selectable: true,
                    data: chat.content ?? '',
                    onTapLink: (text, href, title) async {
                      if (href == null) return;
                      final uri = Uri.parse(href);
                      if (await canLaunchUrl(uri)) launchUrl(uri);
                    },
                    builders: {
                      'code': HighlightBuilder(),
                    },
                  ),
          ),
        )
      ],
    );
  }
}
