import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import '../../navigation/navigation.dart';
import 'app_version_label.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    this.activeRoute = AppRoute.unknown,
  });

  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [DrawerMenuList()]),
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
  const DrawerMenuList({
    super.key,
    this.activeRoute = AppRoute.unknown,
  });

  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        ListTile(
          leading: const Icon(Icons.home_rounded),
          title: const Text("Home"),
          selected: activeRoute == AppRoute.home,
          onTap: () {
            context.goNamed(AppRoute.home.name);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.manage_search_rounded),
          title: const Text("Projects"),
          selected: activeRoute == AppRoute.projects,
          onTap: () {
            context.goNamed(AppRoute.projects.name);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_rounded),
          title: const Text("Settings"),
          selected: activeRoute == AppRoute.settings,
          onTap: () {
            context.goNamed(AppRoute.settings.name);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
