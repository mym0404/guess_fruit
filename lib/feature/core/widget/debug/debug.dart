import '../../../../export.dart';

class Debug extends StatelessWidget {
  const Debug({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellow,
        ),
      ),
      child: child,
    );
  }
}
