import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WeekView {
  thisWeek,
  lastWeek,
}

final weekViewProvider = StateProvider<WeekView>((ref) => WeekView.thisWeek);

class ThisWeekIconButton extends ConsumerWidget {
  const ThisWeekIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekView = ref.watch(weekViewProvider);

    return IconButton(
      tooltip: weekView == WeekView.thisWeek
          ? "View Last Week"
          : "View This Week",
      icon: AnimatedRotation(
        turns: weekView == WeekView.thisWeek ? 0 : 0.5,
        duration: const Duration(milliseconds: 200),
        child: const Icon(
          Icons.arrow_forward_rounded,
        ),
      ),
      onPressed: () {
        ref
            .read(weekViewProvider.notifier)
            .state = weekView == WeekView.thisWeek
            ? WeekView.lastWeek
            : WeekView.thisWeek;
      },
    );
  }
}
