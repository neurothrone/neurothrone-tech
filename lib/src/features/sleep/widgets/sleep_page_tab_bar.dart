import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/domain/domain.dart';
import '../shared/state/providers.dart';

class SleepPageTabBar extends ConsumerWidget {
  const SleepPageTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabProvider);

    return NavigationBar(
      selectedIndex: currentTab.index,
      onDestinationSelected: (index) =>
          ref.read(sleepTabProvider.notifier).setTab(SleepTab.fromIndex(index)),
      destinations: const [
        NavigationDestination(
          label: "Awake?",
          icon: Icon(Icons.access_time_outlined),
          selectedIcon: Icon(Icons.access_time_filled_rounded),
          tooltip: "Is he conscious... or in another dimension?",
        ),
        NavigationDestination(
          label: "Week",
          icon: Icon(Icons.view_week_outlined),
          selectedIcon: Icon(Icons.view_week_rounded),
          tooltip: "This or last week's sleep data, depending on your mood.",
        ),
        NavigationDestination(
          label: "Year",
          icon: Icon(Icons.auto_graph_outlined),
          selectedIcon: Icon(Icons.auto_graph_rounded),
          tooltip: "A year's worth of questionable sleep habits.",
        ),
      ],
    );
  }
}
