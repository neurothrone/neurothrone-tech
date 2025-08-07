import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/navigation.dart';
import '../theme/theme.dart';

final navRailExpandedProvider = StateProvider<bool>((ref) => false);
final navRailShowLabelsProvider = StateProvider<bool>((ref) => false);

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
    final currentRoute = ref.watch(currentRouteProvider);
    final isExpanded = ref.watch(navRailExpandedProvider);
    final showLabels = ref.watch(navRailShowLabelsProvider);

    final double width = isExpanded ? 120 : 72;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: width,
      decoration: BoxDecoration(
        border: Border(right: kBorderSide),
        color: kPanelDarkColor,
      ),
      child: NavigationRail(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            tooltip: isExpanded ? "Collapse navigation" : "Expand navigation",
            icon: Icon(
              isExpanded
                  ? Icons.keyboard_double_arrow_left_rounded
                  : Icons.keyboard_double_arrow_right_rounded,
            ),
            onPressed: () {
              final expandedNotifier = ref.read(
                navRailExpandedProvider.notifier,
              );
              final labelNotifier = ref.read(
                navRailShowLabelsProvider.notifier,
              );
              final currentlyExpanded = ref.read(navRailExpandedProvider);

              if (currentlyExpanded) {
                // Collapse: hide labels first, then shrink
                labelNotifier.state = false;
                Future.delayed(const Duration(milliseconds: 150), () {
                  expandedNotifier.state = false;
                });
              } else {
                // Expand: grow first, then show labels
                expandedNotifier.state = true;
                Future.delayed(const Duration(milliseconds: 200), () {
                  labelNotifier.state = true;
                });
              }
            },
          ),
        ),
        selectedIndex: getNavRailIndex(currentRoute),
        onDestinationSelected: (int index) {
          final route = AppRoute.fromIndex(index);
          context.goNamed(route.name);
        },
        labelType: showLabels
            ? NavigationRailLabelType.all
            : NavigationRailLabelType.none,
        groupAlignment: -1.0,
        destinations: [
          buildNavRailItem(
            label: "Home",
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            showTooltip: !showLabels,
          ),
          buildNavRailItem(
            label: "Projects",
            icon: Icons.folder_outlined,
            selectedIcon: Icons.folder_rounded,
            showTooltip: !showLabels,
          ),
          buildNavRailItem(
            label: "Sleep",
            icon: Icons.bedtime_outlined,
            selectedIcon: Icons.bedtime_rounded,
            showTooltip: !showLabels,
          ),
          buildNavRailItem(
            label: "Settings",
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings_rounded,
            showTooltip: !showLabels,
          ),
        ],
      ),
    );
  }
}
