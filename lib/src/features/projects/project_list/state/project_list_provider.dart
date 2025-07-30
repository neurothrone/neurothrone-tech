import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/networking/networking.dart';
import '../../../../core/utils/utils.dart';
import '../../shared/data/responses/responses.dart';
import '../../shared/services/services.dart';
import 'project_list_state.dart';

final class ProjectListController
    extends StateNotifier<AsyncValue<ProjectListState>> {
  ProjectListController({
    required ProjectNetworkService projectService,
  }) : _projectService = projectService,
       super(AsyncValue.data(ProjectListState.initial()));

  final ProjectNetworkService _projectService;

  Future<void> searchReports({
    int page = 1,
    int pageSize = 10,
    String? query,
  }) async {
    state = const AsyncLoading();

    try {
      final result = await _projectService.searchProjects(
        page: page,
        pageSize: pageSize,
        query: query,
      );
      result.when(
        success: (ProjectSearchResponse response) {
          state = AsyncData(
            ProjectListState(
              currentPage: page,
              pageSize: pageSize,
              totalCount: response.totalCount,
              projects: response.items,
            ),
          );
        },
        failure: (NetworkFailure failure) {
          state = AsyncError(failure.message, StackTrace.current);
        },
      );
    } catch (e, st) {
      state = AsyncError(e, st);
      // if (kDebugMode) {
      //   debugPrint("❌ -> searchReports(), error: $e");
      // }
    }
  }
}
