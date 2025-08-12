import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/models/models.dart';
import '../../../shared/state/sleep_list_state.dart';
import 'week_detail_notifier.dart';

final weekDetailNotifierProvider = AsyncNotifierProvider.autoDispose
    .family<WeekDetailNotifier, SleepListState, SleepWeekSummary>(
      WeekDetailNotifier.new,
    );
