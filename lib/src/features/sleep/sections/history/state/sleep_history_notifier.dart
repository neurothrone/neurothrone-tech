import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/models/models.dart';
import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import 'providers.dart';
import 'sleep_history_state.dart';

final class SleepHistoryNotifier
    extends AutoDisposeAsyncNotifier<SleepHistoryState> {
  SleepNetworkService get _service => ref.read(sleepServiceProvider);

  @override
  Future<SleepHistoryState> build() async {
    final currentYear = ref.watch(selectedYearStateProvider);
    return _loadForYear(currentYear);
  }

  Future<SleepHistoryState> _loadForYear(int year) async {
    final result = await _service.getYearlySleepSummary(year: year);
    return result.when(
      success: (YearlySleepSummary? summary) => SleepHistoryState(
        summary: summary,
      ),
      failure: (NetworkFailure failure) {
        throw Exception(failure.message);
      },
    );
  }
}
