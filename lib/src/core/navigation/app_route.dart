enum AppRoute {
  home,
  contact,
  projects,
  sleep,
  projectDetail,
  unknown;

  static AppRoute fromIndex(int index) {
    return AppRoute.values[index];
  }
}
