enum AppRoute {
  home,
  projects,
  sleep,
  settings,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
