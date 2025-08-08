import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';

final sleepTabProvider = StateProvider<SleepTab>((ref) => SleepTab.status);
