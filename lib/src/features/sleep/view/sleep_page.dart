import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/widgets.dart';
import '../sections/history/ui/sleep_history_view.dart';
import '../sections/status/ui/sleep_status_view.dart';
import '../sections/this_week/ui/sleep_this_week_view.dart';
import '../sections/this_week/ui/widgets/this_week_icon_button.dart';
import '../shared/domain/domain.dart';
import '../shared/state/providers.dart';
import '../widgets/sleep_page_tab_bar.dart';

class SleepPage extends ConsumerWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(sleepTabProvider);

    return AppScaffold(
      title: "Sleep",
      body: const SleepPageBody(),
      actions: switch (currentTab) {
        SleepTab.thisWeek => [
          ThisWeekIconButton(),
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
    final currentTab = ref.watch(sleepTabProvider);

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
