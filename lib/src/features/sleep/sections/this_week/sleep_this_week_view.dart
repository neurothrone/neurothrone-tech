import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/domain.dart';
import 'state/providers.dart';

class SleepThisWeekView extends ConsumerWidget {
  const SleepThisWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekView = ref.watch(weekViewStateProvider);

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
      child: weekView == WeekView.thisWeek
          ? const Text(
              key: ValueKey(WeekView.thisWeek),
              "This Week's Sleep Data",
            )
          : const Text(
              key: ValueKey(WeekView.lastWeek),
              "Last Week's Sleep Data",
            ),
    );
  }
}
