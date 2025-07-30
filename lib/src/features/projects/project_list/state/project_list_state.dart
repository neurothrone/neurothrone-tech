import '../../shared/data/models/models.dart';

final class ProjectListState {
  const ProjectListState({
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.projects,
  });

  factory ProjectListState.initial() => const ProjectListState(
    currentPage: 1,
    pageSize: 10,
    totalCount: 0,
    projects: [],
  );

  final int currentPage;
  final int pageSize;
  final int totalCount;
  final List<ProjectItem> projects;
}
