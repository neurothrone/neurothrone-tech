import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';

abstract interface class SleepNetworkService {
  Future<Result<List<SleepLog>, NetworkFailure>> getCurrentWeekSleepLogs();

  Future<Result<List<SleepLog>, NetworkFailure>> getPreviousWeekSleepLogs();

  Future<Result<YearlySleepSummary, NetworkFailure>> getYearlySleepSummary({
    required int year,
  });

  Future<Result<SleepWeekSummary, NetworkFailure>> getSleepSummaryForWeek({
    required int year,
    required int week,
  });

  Future<Result<List<SleepLog>, NetworkFailure>> getLogsForYearAndWeek({
    required int year,
    required int week,
  });

  Future<Result<List<int>, NetworkFailure>> getHistoryYears();

  Future<Result<bool, NetworkFailure>> isLikelyAwakeNow();
}
