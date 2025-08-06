enum AppRoute {
  home,
  projects,
  time,
  settings,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
