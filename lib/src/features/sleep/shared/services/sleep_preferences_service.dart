import 'package:shared_preferences/shared_preferences.dart';

final class SleepPreferencesService {
  const SleepPreferencesService({
    required SharedPreferencesAsync sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const _selectedTabKey = "sleep_selected_tab";
  final SharedPreferencesAsync _prefs;

  Future<int> getSelectedTabIndex() async {
    return await _prefs.getInt(_selectedTabKey) ?? 0;
  }

  Future<void> setSelectedTabIndex(int index) {
    return _prefs.setInt(_selectedTabKey, index);
  }
}
