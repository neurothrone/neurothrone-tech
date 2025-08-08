import '../../../../core/utils/utils.dart';
import '../data/models/sleep_log.dart';
import '../data/models/sleep_week_summary.dart';
import '../data/models/yearly_sleep_summary.dart';
import 'services.dart';

final class SleepApiService implements SleepNetworkService {
  @override
  Future<Result<List<SleepLog>, NetworkFailure>> getCurrentWeekSleepLogs() {
    // TODO: implement getCurrentWeekSleepLogs
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>> getPreviousWeekSleepLogs() {
    // TODO: implement getPreviousWeekSleepLogs
    throw UnimplementedError();
  }

  @override
  Future<Result<YearlySleepSummary, NetworkFailure>> getYearlySleepSummary({
    required int year,
  }) {
    // TODO: implement getYearlySleepSummary
    throw UnimplementedError();
  }

  @override
  Future<Result<SleepWeekSummary, NetworkFailure>> getSleepSummaryForWeek({
    required int year,
    required int week,
  }) {
    // TODO: implement getSleepSummaryForWeek
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, NetworkFailure>> isLikelyAwakeNow() {
    // TODO: implement isLikelyAwakeNow
    throw UnimplementedError();
  }
}
