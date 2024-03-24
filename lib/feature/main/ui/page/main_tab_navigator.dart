import '../../../../export.dart';
import '../../../../service/layout/layout_manager.dart';

class MainTabNavigator extends StatelessWidget with WatchItMixin {
  const MainTabNavigator({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    var isWideScreen =
        watchPropertyValue((LayoutManager layout) => layout.size).width >= 600;

    if (isWideScreen) {
      var destinations = MainTab.values
          .map(
            (tab) => NavigationRailDestination(
                icon: Icon(tab.icon), label: Text(tab.name)),
          )
          .toList();

      return Row(
        children: [
          NavigationRail(
            destinations: destinations,
            selectedIndex: child.currentIndex,
            onDestinationSelected: (index) => child.goBranch(index),
            labelType: NavigationRailLabelType.all,
          ),
          VerticalDivider(color: context.c.onSurface.withOpacity(0.1)),
          Expanded(child: child),
        ],
      );
    } else {
      var destinations = MainTab.values
          .map(
            (tab) =>
                NavigationDestination(icon: Icon(tab.icon), label: tab.name),
          )
          .toList();

      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: destinations,
          selectedIndex: child.currentIndex,
          onDestinationSelected: (index) => child.goBranch(index),
        ),
        body: child,
      );
    }
  }
}

enum MainTab {
  home,
  settings,
  ;

  IconData get icon => switch (this) {
        MainTab.home => MdiIcons.home,
        MainTab.settings => MdiIcons.cog,
      };

  String get name => switch (this) {
        MainTab.home => 'Home',
        MainTab.settings => 'Settings',
      };
}
