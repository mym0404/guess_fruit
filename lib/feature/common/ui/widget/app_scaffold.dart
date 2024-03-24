import '../../../../export.dart';
import '../../../../service/layout/layout_manager.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.isUsageSubContainer = false,
  });

  final Widget child;
  final bool isUsageSubContainer;

  const AppScaffold.subContainer({
    Key? key,
    required Widget child,
  }) : this(key: key, child: child, isUsageSubContainer: true);

  @override
  Widget build(BuildContext context) {
    if (!isUsageSubContainer) {
      var mq = MediaQuery.of(context);
      doOnLayout(() {
        di<LayoutManager>().onSizeChanged(
          size: mq.size,
          padding: mq.padding,
          viewPadding: mq.viewPadding,
          viewInsets: mq.viewInsets,
        );
      });
    }

    return DefaultTextStyle(
      style: TS.bodyMedium,
      child: child,
    );
  }
}
