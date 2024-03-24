import '../../../export.dart';

extension SnackBarExtension on BuildContext {
  void _showSnackBar({
    required String text,
    IconData? icon,
    Color? backgroundColor,
    String? body,
  }) {
    ScaffoldMessenger.maybeOf(this)
      ?..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[Icon(icon), const Gap(12)],
                  Text(text, style: TS.bodyLarge.bold.c(c.onSurface)),
                ],
              ),
              if (body != null)
                PaddingTop(
                  8,
                  child:
                      Text(body, style: TS.labelMedium.medium.c(c.onSurface70)),
                ),
            ],
          ),
          showCloseIcon: true,
          closeIconColor: c.onSurface,
          backgroundColor: backgroundColor ?? c.surface70,
          duration: const Duration(milliseconds: 3000),
        ),
      );
  }

  void showSuccessSnackBar({required String text, String? body}) {
    _showSnackBar(
      text: text,
      icon: MdiIcons.checkCircle,
      backgroundColor: Colors.green.withOpacity(0.8),
      body: body,
    );
  }

  void showErrorSnackBar({required String text, String? body}) {
    _showSnackBar(
      text: text,
      icon: MdiIcons.emoticonCry,
      backgroundColor: Colors.red.withOpacity(0.8),
      body: body,
    );
  }

  void showWarningSnackBar({required String text, String? body}) {
    _showSnackBar(
      text: text,
      icon: MdiIcons.exclamationThick,
      backgroundColor: Colors.orange.withOpacity(0.8),
      body: body,
    );
  }

  void showInfoSnackBar({required String text, String? body}) {
    _showSnackBar(
      text: text,
      icon: MdiIcons.information,
      backgroundColor: Colors.blue.withOpacity(0.8),
      body: body,
    );
  }
}
