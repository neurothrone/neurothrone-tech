enum AppRoute {
  home,
  projects,
  sleep,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
