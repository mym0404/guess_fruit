import '../../export.dart';

extension RouteExtension on BuildContext {
  void popNavigator<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }

  bool canPopNavigator() => Navigator.canPop(this);
}
