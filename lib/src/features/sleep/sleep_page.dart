import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/widgets.dart';
import 'sections/history/sleep_history_view.dart';
import 'sections/history/state/providers.dart';
import 'sections/history/widgets/year_menu_anchor.dart';
import 'sections/status/sleep_status_view.dart';
import 'sections/this_week/domain/domain.dart';
import 'sections/this_week/sleep_this_week_view.dart';
import 'sections/this_week/state/providers.dart';
import 'sections/this_week/widgets/week_display_mode_toggle.dart';
import 'sections/this_week/widgets/week_view_toggle.dart';
import 'shared/domain/domain.dart';
import 'shared/state/providers.dart';

class SleepPage extends ConsumerWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabNotifierProvider);

    return AppScaffold(
      title: "Sleep",
      body: const SleepPageBody(),
      actions: switch (currentTab) {
        SleepTab.thisWeek => const [
          WeekDisplayModeToggle(),
          WeekViewToggle(),
        ],
        SleepTab.history => const [
          YearMenuAnchor(),
        ],
        _ => null,
      },
      bottomNavigationBar: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          SleepPageTabBar(),
        ],
      ),
    );
  }
}

class SleepPageBody extends ConsumerWidget {
  const SleepPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabNotifierProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: switch (currentTab) {
        SleepTab.status => const SleepStatusView(
          key: ValueKey(SleepTab.status),
        ),
        SleepTab.thisWeek => const SleepThisWeekView(
          key: ValueKey(SleepTab.thisWeek),
        ),
        SleepTab.history => const SleepHistoryView(
          key: ValueKey(SleepTab.history),
        ),
      },
    );
  }
}

class SleepPageTabBar extends ConsumerWidget {
  const SleepPageTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabNotifierProvider);
    final weekView = ref.watch(weekViewStateProvider);
    final selectedYear = ref.watch(selectedYearStateProvider);

    return NavigationBar(
      selectedIndex: currentTab.index,
      onDestinationSelected: (index) => ref
          .read(sleepTabNotifierProvider.notifier)
          .setTab(SleepTab.fromIndex(index)),
      destinations: [
        const NavigationDestination(
          label: "Awake?",
          icon: Icon(Icons.access_time_outlined),
          selectedIcon: Icon(Icons.access_time_filled_rounded),
          tooltip: "Is he conscious... or in another dimension?",
        ),
        NavigationDestination(
          label: weekView == WeekView.thisWeek ? "This Week" : "Last Week",
          icon: const Icon(Icons.view_week_outlined),
          selectedIcon: const Icon(Icons.view_week_rounded),
          tooltip: "This or last week's sleep data, depending on your mood.",
        ),
        NavigationDestination(
          label: selectedYear == DateTime.now().year
              ? "This Year"
              : "Year $selectedYear",
          icon: Icon(Icons.auto_graph_outlined),
          selectedIcon: Icon(Icons.auto_graph_rounded),
          tooltip: "A year's worth of questionable sleep habits.",
        ),
      ],
    );
  }
}
