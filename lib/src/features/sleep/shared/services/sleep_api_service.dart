import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import 'services.dart';

final class SleepApiService implements SleepNetworkService {
  @override
  Future<Result<SleepLog?, NetworkFailure>> getMostRecentSleepLog() {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>> getCurrentWeekSleepLogs() {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>> getPreviousWeekSleepLogs() {
    throw UnimplementedError();
  }

  @override
  Future<Result<YearlySleepSummary, NetworkFailure>> getYearlySleepSummary({
    required int year,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<SleepWeekSummary, NetworkFailure>> getSleepSummaryForWeek({
    required int year,
    required int week,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>> getLogsForYearAndWeek({
    required int year,
    required int week,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<int>, NetworkFailure>> getHistoryYears() {
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, NetworkFailure>> isLikelyAwakeNow() {
    throw UnimplementedError();
  }
}
