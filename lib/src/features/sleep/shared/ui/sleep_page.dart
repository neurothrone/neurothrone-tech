import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/widgets/widgets.dart';
import '../domain/domain.dart';
import '../state/providers.dart';
import 'views/views.dart';
import 'widgets/sleep_page_tab_bar.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Sleep",
      body: SleepPageBody(),
      bottomNavigationBar: Column(
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
