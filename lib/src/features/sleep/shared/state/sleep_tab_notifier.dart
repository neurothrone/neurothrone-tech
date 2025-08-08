import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/domain.dart';
import '../services/services.dart';

class SleepTabNotifier extends StateNotifier<SleepTab> {
  SleepTabNotifier({
    required SleepPreferencesService service,
  }) : _service = service,
       super(SleepTab.status) {
    _load();
  }

  final SleepPreferencesService _service;

  Future<void> _load() async {
    final index = await _service.getSelectedTabIndex();
    state = SleepTab.fromIndex(index);
  }

  Future<void> setTab(SleepTab tab) async {
    state = tab;
    await _service.setSelectedTabIndex(tab.index);
  }
}
