import '../../export.dart';

class DarkTheme extends StatelessWidget {
  const DarkTheme({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.instance.createTheme(Brightness.dark),
      child: child,
    );
  }
}
