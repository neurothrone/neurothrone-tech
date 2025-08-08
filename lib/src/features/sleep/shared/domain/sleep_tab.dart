enum SleepTab {
  status,
  thisWeek,
  history;

  static SleepTab fromIndex(int index) {
    return SleepTab.values[index];
  }
}
