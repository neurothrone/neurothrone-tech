import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
import '../../../shared/services/services.dart';
import 'sleep_list_state.dart';

final class SleepListNotifier
    extends StateNotifier<AsyncValue<SleepListState>> {
  SleepListNotifier({
    required SleepNetworkService service,
  }) : _service = service,
       super(AsyncValue.data(SleepListState.initial()));

  final SleepNetworkService _service;

  Future<void> fetchCurrentWeekLogs() async {
    state = const AsyncLoading();

    try {
      final result = await _service.getCurrentWeekSleepLogs();
      result.when(
        success: (List<SleepLog> logs) {
          state = AsyncData(SleepListState(logs: logs));
        },
        failure: (NetworkFailure failure) {
          state = AsyncError(failure.message, StackTrace.current);
        },
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> fetchPreviousWeekLogs() async {
    state = const AsyncLoading();

    try {
      final result = await _service.getPreviousWeekSleepLogs();
      result.when(
        success: (List<SleepLog> logs) {
          state = AsyncData(SleepListState(logs: logs));
        },
        failure: (NetworkFailure failure) {
          state = AsyncError(failure.message, StackTrace.current);
        },
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
