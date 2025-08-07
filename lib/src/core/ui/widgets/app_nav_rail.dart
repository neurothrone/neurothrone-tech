import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/navigation.dart';
import '../theme/theme.dart';

final navRailExpandedProvider = StateProvider<bool>((ref) => false);

class AppNavRail extends ConsumerWidget {
  const AppNavRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoute = ref.watch(currentRouteProvider);
    final isExpanded = ref.watch(navRailExpandedProvider);

    return Container(
      width: isExpanded ? 100 : 72,
      decoration: BoxDecoration(
        border: Border(right: kBorderSide),
        color: kPanelDarkColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: NavigationRail(
              groupAlignment: -1.0,
              selectedIndex: getNavRailIndex(activeRoute),
              onDestinationSelected: (int index) {
                final route = AppRoute.fromIndex(index);
                context.goNamed(route.name);
              },
              labelType: isExpanded
                  ? NavigationRailLabelType.all
                  : NavigationRailLabelType.none,
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
                  label: Text("Sleep"),
                  icon: Icon(Icons.bedtime_outlined),
                  selectedIcon: Icon(Icons.bedtime_rounded),
                ),
                NavigationRailDestination(
                  label: Text("Settings"),
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings_rounded),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: isExpanded ? "Collapse navigation" : "Expand navigation",
            icon: Icon(isExpanded ? Icons.chevron_left : Icons.chevron_right),
            onPressed: () {
              ref.read(navRailExpandedProvider.notifier).state = !isExpanded;
            },
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
