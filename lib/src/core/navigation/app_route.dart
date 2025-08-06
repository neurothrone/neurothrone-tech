enum AppRoute {
  home,
  projects,
  settings,
  time,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
