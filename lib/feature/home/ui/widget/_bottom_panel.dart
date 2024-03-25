part of '../page/home_page.dart';

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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: 8.radius,
            gradient: LinearGradient(
              colors: [
                !focusNode.hasFocus ? C.grey800 : C.primary,
                !focusNode.hasFocus ? C.grey800 : C.error
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
