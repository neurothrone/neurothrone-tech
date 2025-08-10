import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';
import '../state/providers.dart';

class ToggleWeekButton extends ConsumerWidget {
  const ToggleWeekButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekView = ref.watch(weekViewStateProvider);

    return IconButton(
      tooltip: weekView == WeekView.thisWeek
          ? "View Last Week"
          : "View This Week",
      style: Theme.of(context).iconButtonTheme.style,
      icon: AnimatedRotation(
        turns: weekView == WeekView.thisWeek ? 0 : 0.5,
        duration: const Duration(milliseconds: 200),
        child: const Icon(
          Icons.swap_horiz_rounded,
        ),
      ),
      onPressed: () {
        ref
            .read(weekViewStateProvider.notifier)
            .state = weekView == WeekView.thisWeek
            ? WeekView.lastWeek
            : WeekView.thisWeek;
      },
    );
  }
}
