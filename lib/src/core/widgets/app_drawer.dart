import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/constants.dart';
import '../navigation/navigation.dart';
import '../theme/theme.dart';
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
    final currentRoute = ref.watch(currentRouteProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DrawerHeader(
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: kPrimaryColor.withValues(alpha: 0.8),
          ),
          child: const Text(
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
          selected: currentRoute == AppRoute.home,
        ),
        DrawerListTile(
          title: "Contact",
          icon: Icons.contact_page_outlined,
          selectedIcon: Icons.contact_page_rounded,
          route: AppRoute.contact,
          selected: currentRoute == AppRoute.contact,
        ),
        DrawerListTile(
          title: "Projects",
          icon: Icons.folder_outlined,
          selectedIcon: Icons.folder_rounded,
          route: AppRoute.projects,
          selected: currentRoute == AppRoute.projects,
        ),
        DrawerListTile(
          title: "Sleep",
          icon: Icons.bedtime_outlined,
          selectedIcon: Icons.bedtime_rounded,
          route: AppRoute.sleep,
          selected: currentRoute == AppRoute.sleep,
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
    this.selected = false,
  });

  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final AppRoute route;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      leading: Icon(selected ? selectedIcon : icon),
      title: Text(title),
      onTap: () {
        context.goNamed(route.name);
        Navigator.pop(context);
      },
    );
  }
}
