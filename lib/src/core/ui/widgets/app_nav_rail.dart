import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/navigation.dart';
import '../theme/theme.dart';

class AppNavRail extends ConsumerWidget {
  const AppNavRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoute = ref.watch(currentRouteProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: borderDividerStyle,
        ),
      ),
      child: NavigationRail(
        groupAlignment: -1.0,
        selectedIndex: getNavRailIndex(activeRoute),
        onDestinationSelected: (int index) {
          final route = AppRoute.fromIndex(index);
          context.goNamed(route.name);
        },
        labelType: NavigationRailLabelType.all,
        destinations: const [
          NavigationRailDestination(
            label: Text("Home"),
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
          ),
          NavigationRailDestination(
            label: Text("Projects"),
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder_rounded),
          ),
          NavigationRailDestination(
            label: Text("Settings"),
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
          ),
          NavigationRailDestination(
            label: Text("Time"),
            icon: Icon(Icons.insert_chart_outlined_rounded),
            selectedIcon: Icon(Icons.insert_chart_rounded),
          ),
        ],
      ),
    );
  }
}
