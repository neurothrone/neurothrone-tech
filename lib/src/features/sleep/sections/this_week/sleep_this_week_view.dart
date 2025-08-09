import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/data/models/models.dart';
import 'state/providers.dart';
import 'state/sleep_list_state.dart';

class SleepThisWeekView extends ConsumerWidget {
  const SleepThisWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekView = ref.watch(weekViewStateProvider);
    final sleepLogsAsyncState = ref.watch(
      sleepListNotifierProvider(weekView),
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
      child: sleepLogsAsyncState.when(
        data: (SleepListState state) {
          if (state.logs.isEmpty) {
            return const Center(
              child: Text("No sleep logs available for this week."),
            );
          }
          return SleepLogList(logs: state.logs);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("Error loading sleep logs: $error"),
        ),
      ),
    );
  }
}

class SleepLogList extends StatelessWidget {
  const SleepLogList({
    super.key,
    required this.logs,
  });

  final List<SleepLog> logs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logs.length,
      itemBuilder: (context, index) {
        final log = logs[index];
        return ListTile(
          title: Text(log.wokeUpAt.toIso8601String()),
          subtitle: Text(
            "Duration: ${log.duration.inHours}h ${log.duration.inMinutes.remainder(60)}m",
          ),
        );
      },
    );
  }
}
