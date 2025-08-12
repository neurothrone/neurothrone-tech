import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/data/models/models.dart';
import '../../shared/state/providers.dart';
import '../../shared/widgets/week_logs_switcher.dart';
import '../../shared/widgets/week_display_mode_toggle.dart';
import 'state/providers.dart';

class WeekDetailPage extends StatelessWidget {
  const WeekDetailPage({
    super.key,
    required this.summary,
  });

  final SleepWeekSummary summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week ${summary.week}"),
        actions: [
          const WeekDisplayModeToggle(),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final logsAsyncState = ref.watch(weekDetailNotifierProvider(summary));
          final displayMode = ref.watch(weekDisplayModeStateProvider);
          return WeekLogsSwitcher(
            asyncState: logsAsyncState,
            displayMode: displayMode,
          );
        },
      ),
    );
  }
}
