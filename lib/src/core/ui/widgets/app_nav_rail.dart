import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/navigation.dart';

class AppNavRail extends ConsumerWidget {
  const AppNavRail({
    super.key,
    required this.activeRoute,
  });

  static const _routes = [
    AppRoute.home,
    AppRoute.projects,
    AppRoute.settings,
  ];

  final AppRoute activeRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      groupAlignment: -1.0,
      backgroundColor: Colors.deepPurpleAccent,
      selectedIndex: _routes.indexOf(activeRoute),
      onDestinationSelected: (int index) {
        final route = _routes[index];
        context.goNamed(route.name);
      },
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_rounded),
          selectedIcon: Icon(Icons.home),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.manage_search_rounded),
          selectedIcon: Icon(Icons.manage_search),
          label: Text("Projects"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_rounded),
          selectedIcon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
    );
  }
}
