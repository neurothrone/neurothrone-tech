import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/providers.dart';
import 'state/sleep_history_state.dart';
import 'widgets/sleep_history_list.dart';

class SleepHistoryView extends ConsumerWidget {
  const SleepHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepSummaryAsyncState = ref.watch(
      sleepHistoryNotifierProvider,
    );

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
      child: sleepSummaryAsyncState.when(
        data: (SleepHistoryState state) {
          if (state.summary == null || state.summary!.weeklySummaries.isEmpty) {
            return const Center(
              child: Text("No sleep history available for this year."),
            );
          }

          return SleepHistoryList(summaries: state.summary!.weeklySummaries);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("Error loading sleep history: $error"),
        ),
      ),
    );
  }
}
