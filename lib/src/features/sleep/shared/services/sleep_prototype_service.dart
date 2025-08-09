import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import 'services.dart';

final class SleepPrototypeService implements SleepNetworkService {
  final List<SleepLog> _allLogs = _generateFakeLogs();

  static List<SleepLog> _generateFakeLogs() {
    final now = DateTime.now();
    final List<SleepLog> logs = [];

    // Generate 50 logs, 1 per day, for the past ~7 weeks
    for (int i = 0; i < 50; i++) {
      final wakeUp = now.subtract(Duration(hours: i * 24 + 8));
      final sleep = wakeUp.subtract(Duration(hours: 7, minutes: i % 60));
      logs.add(SleepLog(wokeUpAt: wakeUp, fellAsleepAt: sleep));
    }

    // Generate logs for last year and two years ago - one per day for 2 months (60 days each)
    for (final year in [now.year - 1, now.year - 2]) {
      final start = DateTime(year, 1, 1, 8);
      for (int i = 0; i < 60; i++) {
        final wakeUp = start.add(Duration(days: i));
        final sleep = wakeUp.subtract(Duration(hours: 7, minutes: i % 60));
        logs.add(SleepLog(wokeUpAt: wakeUp, fellAsleepAt: sleep));
      }
    }

    return logs;
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>>
  getCurrentWeekSleepLogs() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final currentWeek = _weekNumber(now);
    final currentYear = now.year;

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return _weekNumber(date) == currentWeek && date.year == currentYear;
    }).toList();

    return Result.success(value: logs);
  }

  @override
  Future<Result<List<SleepLog>, NetworkFailure>>
  getPreviousWeekSleepLogs() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final previousWeekDate = now.subtract(Duration(days: 7));
    final previousWeek = _weekNumber(previousWeekDate);
    final year = previousWeekDate.year;

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return _weekNumber(date) == previousWeek && date.year == year;
    }).toList();

    return Result.success(value: logs);
  }

  @override
  Future<Result<YearlySleepSummary, NetworkFailure>> getYearlySleepSummary({
    required int year,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final logs = _allLogs.where((log) => log.wokeUpAt.year == year);
    final Map<int, List<SleepLog>> weekMap = {};
    for (final log in logs) {
      final week = _weekNumber(log.wokeUpAt);
      weekMap.putIfAbsent(week, () => []).add(log);
    }

    final summaries = weekMap.entries.map((entry) {
      final totalSeconds = entry.value.fold<int>(
        0,
        (sum, log) => sum + log.duration.inSeconds,
      );
      return SleepWeekSummary(
        week: entry.key,
        year: year,
        totalSleepSeconds: totalSeconds,
      );
    }).toList()..sort((a, b) => b.week.compareTo(a.week)); // Descending by week

    return Result.success(
      value: YearlySleepSummary(
        weeklySummaries: summaries,
        totalCount: summaries.length,
      ),
    );
  }

  @override
  Future<Result<SleepWeekSummary, NetworkFailure>> getSleepSummaryForWeek({
    required int year,
    required int week,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final logs = _allLogs.where((log) {
      final date = log.wokeUpAt;
      return date.year == year && _weekNumber(date) == week;
    });
    final totalSeconds = logs.fold<int>(
      0,
      (sum, log) => sum + log.duration.inSeconds,
    );

    return Result.success(
      value: SleepWeekSummary(
        week: week,
        year: year,
        totalSleepSeconds: totalSeconds,
      ),
    );
  }

  @override
  Future<Result<bool, NetworkFailure>> isLikelyAwakeNow() async {
    await Future.delayed(const Duration(seconds: 1));

    // 70% chance to be awake for fun
    return Result.success(value: DateTime.now().millisecond % 10 < 7);
  }

  int _weekNumber(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final daysSinceYearStart = date.difference(firstDayOfYear).inDays;
    return ((daysSinceYearStart + firstDayOfYear.weekday) / 7).ceil();
  }

  @override
  Future<Result<List<int>, NetworkFailure>> getHistoryYears() async {
    await Future.delayed(const Duration(seconds: 1));
    final years = _allLogs
        .map((e) => e.wokeUpAt.year)
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));
    return Result.success(value: years);
  }
}
