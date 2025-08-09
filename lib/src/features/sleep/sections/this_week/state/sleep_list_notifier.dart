import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import '../domain/domain.dart';
import 'providers.dart';
import 'sleep_list_state.dart';

final class SleepListNotifier extends AutoDisposeAsyncNotifier<SleepListState> {
  SleepNetworkService get _service => ref.read(sleepServiceProvider);

  @override
  Future<SleepListState> build() async {
    final currentWeek = ref.watch(weekViewStateProvider);
    return _loadForWeek(currentWeek);
  }

  Future<SleepListState> _loadForWeek(WeekView week) async {
    final result = switch (week) {
      WeekView.thisWeek => await _service.getCurrentWeekSleepLogs(),
      WeekView.lastWeek => await _service.getPreviousWeekSleepLogs(),
    };
    return result.when(
      success: (List<SleepLog> logs) => SleepListState(logs: logs),
      failure: (NetworkFailure failure) {
        throw Exception(failure.message);
      },
    );
  }
}
