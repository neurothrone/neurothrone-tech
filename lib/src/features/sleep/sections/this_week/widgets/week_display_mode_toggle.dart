import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';
import '../state/providers.dart';

class WeekDisplayModeToggle extends ConsumerWidget {
  const WeekDisplayModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDisplayMode = ref.watch(weekDisplayModeStateProvider);

    return IconButton(
      tooltip: weekDisplayMode == WeekDisplayMode.list
          ? "View as Chart"
          : "View as List",
      style: Theme.of(context).iconButtonTheme.style,
      icon: Icon(
        weekDisplayMode == WeekDisplayMode.list
            ? Icons.bar_chart_rounded
            : Icons.list_rounded,
      ),
      onPressed: () {
        ref
            .read(weekDisplayModeStateProvider.notifier)
            .state = weekDisplayMode == WeekDisplayMode.list
            ? WeekDisplayMode.chart
            : WeekDisplayMode.list;
      },
    );
  }
}
