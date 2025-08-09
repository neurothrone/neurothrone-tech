import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
import '../../../shared/services/services.dart';
import 'sleep_history_state.dart';

final class SleepHistoryNotifier
    extends StateNotifier<AsyncValue<SleepHistoryState>> {
  SleepHistoryNotifier({
    required SleepNetworkService service,
  }) : _service = service,
       super(AsyncValue.data(SleepHistoryState.initial()));

  final SleepNetworkService _service;

  Future<void> loadForYear(int year) async {
    state = const AsyncLoading();

    try {
      final result = await _service.getYearlySleepSummary(year: year);
      result.when(
        success: (YearlySleepSummary? summary) {
          state = AsyncData(SleepHistoryState(summary: summary));
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
