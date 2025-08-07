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

    Widget buildRailIcon({
      required bool showTooltip,
      required String tooltip,
      required IconData icon,
    }) {
      final iconWidget = Icon(icon);
      return showTooltip
          ? Tooltip(
              message: tooltip,
              waitDuration: Duration(milliseconds: 0),
              child: iconWidget,
            )
          : iconWidget;
    }

    return Container(
      width: isExpanded ? 100 : 72,
      decoration: BoxDecoration(
        border: Border(right: kBorderSide),
        color: kPanelDarkColor,
      ),
      child: NavigationRail(
        selectedIndex: getNavRailIndex(activeRoute),
        onDestinationSelected: (int index) {
          final route = AppRoute.fromIndex(index);
          context.goNamed(route.name);
        },
        leading: IconButton(
          tooltip: isExpanded ? "Collapse navigation" : "Expand navigation",
          icon: Icon(
            isExpanded
                ? Icons.keyboard_double_arrow_left_rounded
                : Icons.keyboard_double_arrow_right_rounded,
          ),
          onPressed: () {
            ref.read(navRailExpandedProvider.notifier).state = !isExpanded;
          },
        ),
        labelType: isExpanded
            ? NavigationRailLabelType.all
            : NavigationRailLabelType.none,
        groupAlignment: -1.0,
        destinations: [
          NavigationRailDestination(
            label: Text("Home"),
            icon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Home",
              icon: Icons.home_outlined,
            ),
            selectedIcon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Home",
              icon: Icons.home_rounded,
            ),
          ),
          NavigationRailDestination(
            label: Text("Projects"),
            icon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Projects",
              icon: Icons.folder_outlined,
            ),
            selectedIcon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Projects",
              icon: Icons.folder_rounded,
            ),
          ),
          NavigationRailDestination(
            label: Text("Sleep"),
            icon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Sleep",
              icon: Icons.bedtime_outlined,
            ),
            selectedIcon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Sleep",
              icon: Icons.bedtime_rounded,
            ),
          ),
          NavigationRailDestination(
            label: Text("Settings"),
            icon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Settings",
              icon: Icons.settings_outlined,
            ),
            selectedIcon: buildRailIcon(
              showTooltip: !isExpanded,
              tooltip: "Settings",
              icon: Icons.settings_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

// class NavRailItem extends NavigationRailDestination {
//   const NavRailItem({
//     this.showTooltip = true,
//     required super.icon,
//     required super.label,
//   });
//
//   final bool showTooltip;
// }
