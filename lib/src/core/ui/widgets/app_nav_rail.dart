import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/navigation.dart';
import '../theme/theme.dart';

final navRailExpandedProvider = StateProvider<bool>((ref) => false);

NavigationRailDestination buildNavRailItem({
  required String label,
  required IconData icon,
  required IconData selectedIcon,
  required bool showTooltip,
}) {
  Widget wrapWithTooltip(IconData iconData) => showTooltip
      ? Tooltip(
          message: label,
          waitDuration: Duration.zero,
          child: Icon(iconData),
        )
      : Icon(iconData);

  return NavigationRailDestination(
    label: Text(label),
    icon: wrapWithTooltip(icon),
    selectedIcon: wrapWithTooltip(selectedIcon),
  );
}

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
      child: NavigationRail(
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
        selectedIndex: getNavRailIndex(activeRoute),
        onDestinationSelected: (int index) {
          final route = AppRoute.fromIndex(index);
          context.goNamed(route.name);
        },
        labelType: isExpanded
            ? NavigationRailLabelType.all
            : NavigationRailLabelType.none,
        groupAlignment: -1.0,
        destinations: [
          buildNavRailItem(
            label: "Home",
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            showTooltip: !isExpanded,
          ),
          buildNavRailItem(
            label: "Projects",
            icon: Icons.folder_outlined,
            selectedIcon: Icons.folder_rounded,
            showTooltip: !isExpanded,
          ),
          buildNavRailItem(
            label: "Sleep",
            icon: Icons.bedtime_outlined,
            selectedIcon: Icons.bedtime_rounded,
            showTooltip: !isExpanded,
          ),
          buildNavRailItem(
            label: "Settings",
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings_rounded,
            showTooltip: !isExpanded,
          ),
        ],
      ),
    );
  }
}
