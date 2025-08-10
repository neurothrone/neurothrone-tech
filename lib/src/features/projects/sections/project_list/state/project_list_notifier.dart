import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/utils.dart';
import '../../../shared/data/responses/responses.dart';
import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
import 'project_list_state.dart';
import 'providers.dart';

final class ProjectListNotifier
    extends AutoDisposeAsyncNotifier<ProjectListState> {
  ProjectNetworkService get _service => ref.read(projectServiceProvider);

  String? _activeQuery;

  @override
  Future<ProjectListState> build() async {
    const int page = 1;
    const int pageSize = 10;

    final raw = ref.read(searchTextStateProvider).trim();
    _activeQuery = raw.isEmpty ? null : raw;

    return _fetch(page: page, pageSize: pageSize, query: _activeQuery);
  }

  Future<ProjectListState> _fetch({
    required int page,
    required int pageSize,
    String? query,
  }) async {
    final result = await _service.searchProjects(
      page: page,
      pageSize: pageSize,
      query: query,
    );

    return result.when(
      success: (ProjectSearchResponse response) => ProjectListState(
        currentPage: page,
        pageSize: pageSize,
        totalCount: response.totalCount,
        projects: response.items,
      ),
      failure: (NetworkFailure failure) => throw Exception(failure.message),
    );
  }

  Future<void> searchReports({
    int page = 1,
    int pageSize = 10,
    String? query,
  }) async {
    // Cache the active query if provided; otherwise reuse previous.
    if (query != null) {
      final q = query.trim();
      _activeQuery = q.isEmpty ? null : q;
      // Keep external state provider in sync for UI pieces that read it.
      ref.read(searchTextStateProvider.notifier).state = query;
    }

    final effectiveQuery = _activeQuery;
    state = const AsyncLoading();

    try {
      final next = await _fetch(
        page: page,
        pageSize: pageSize,
        query: effectiveQuery,
      );
      state = AsyncData(next);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> setQuery(String value) async {
    final q = value.trim();
    _activeQuery = q.isEmpty ? null : q;
    ref.read(searchTextStateProvider.notifier).state = value;
    await searchReports(page: 1, query: _activeQuery);
  }

  Future<void> goToPage(int newPage) async {
    final current = state.valueOrNull;
    final size = current?.pageSize ?? 10;
    await searchReports(page: newPage, pageSize: size);
  }
}
