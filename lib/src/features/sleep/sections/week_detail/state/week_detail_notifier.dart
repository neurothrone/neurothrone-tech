import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/models/models.dart';
import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import '../../../shared/state/sleep_list_state.dart';

final class WeekDetailNotifier
    extends AutoDisposeFamilyAsyncNotifier<SleepListState, SleepWeekSummary> {
  SleepNetworkService get _service => ref.read(sleepServiceProvider);

  @override
  Future<SleepListState> build(SleepWeekSummary summary) async {
    final result = await _service.getLogsForYearAndWeek(
      year: summary.year,
      week: summary.week,
    );

    return result.when(
      success: (logs) => SleepListState(logs: logs),
      failure: (failure) => throw Exception(failure.message),
    );
  }
}
