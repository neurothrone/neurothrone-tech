enum AppRoute {
  home,
  projects,
  settings,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
