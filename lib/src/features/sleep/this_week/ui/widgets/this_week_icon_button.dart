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
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          key: ValueKey(weekView),
          weekView == WeekView.thisWeek
              ? Icons.arrow_back_rounded
              : Icons.arrow_forward_rounded,
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
