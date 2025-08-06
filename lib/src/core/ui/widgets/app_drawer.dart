import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import '../../navigation/navigation.dart';
import 'app_version_label.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [
              DrawerMenuList(),
            ]),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(height: 1.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: AppVersionLabel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenuList extends ConsumerWidget {
  const DrawerMenuList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoute = ref.watch(currentRouteProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DrawerHeader(
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
          ),
          child: Text(
            AppConstants.appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        DrawerListTile(
          title: "Home",
          icon: Icons.home_outlined,
          selectedIcon: Icons.home_rounded,
          route: AppRoute.home,
          activeRoute: activeRoute,
        ),
        DrawerListTile(
          title: "Projects",
          icon: Icons.folder_outlined,
          selectedIcon: Icons.folder_rounded,
          route: AppRoute.projects,
          activeRoute: activeRoute,
        ),
        DrawerListTile(
          title: "Settings",
          icon: Icons.settings_outlined,
          selectedIcon: Icons.settings_rounded,
          route: AppRoute.settings,
          activeRoute: activeRoute,
        ),
        DrawerListTile(
          title: "Time",
          icon: Icons.insert_chart_outlined_rounded,
          selectedIcon: Icons.insert_chart_rounded,
          route: AppRoute.time,
          activeRoute: activeRoute,
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.route,
    required this.activeRoute,
  });

  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final AppRoute route;
  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: activeRoute == route,
      leading: Icon(activeRoute == route ? selectedIcon : icon),
      title: Text(title),
      onTap: () {
        context.goNamed(route.name);
        Navigator.pop(context);
      },
    );
  }
}
