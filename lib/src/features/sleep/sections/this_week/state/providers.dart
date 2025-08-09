import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';

final weekViewStateProvider = StateProvider<WeekView>(
  (ref) => WeekView.thisWeek,
);
