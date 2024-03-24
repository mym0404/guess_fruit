import '../../export.dart';

class LightTheme extends StatelessWidget {
  const LightTheme({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.instance.createTheme(Brightness.light),
      child: child,
    );
  }
}
