import 'dart:async';

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
  static const int _debounceMs = 350;

  @override
  Future<ProjectListState> build() async {
    // Watch a provider that holds {query, page, pageSize}
    final params = ref.watch(projectListQueryNotifierProvider);
    final rawQuery = params.query?.trim();
    final normalizedQuery = (rawQuery == null || rawQuery.isEmpty) ? null : rawQuery;
    final searchChanged = normalizedQuery != _activeQuery;
    _activeQuery = normalizedQuery;

    // If the search text changed, debounce and then re-read latest params.
    if (searchChanged) {
      await Future<void>.delayed(const Duration(milliseconds: _debounceMs));
      final latest = ref.read(projectListQueryNotifierProvider);
      final latestRaw = latest.query?.trim();
      final latestQuery = (latestRaw == null || latestRaw.isEmpty) ? null : latestRaw;
      _activeQuery = latestQuery;

      // Reset to page 1 when searching (the params provider can also enforce this).
      final effectivePage = 1;
      return _fetch(
        page: effectivePage,
        pageSize: latest.pageSize,
        query: _activeQuery,
      );
    }

    // No search change: fetch with current params.
    return _fetch(
      page: params.page,
      pageSize: params.pageSize,
      query: _activeQuery,
    );
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
    // Delegate to the params provider; build() will react and fetch.
    final notifier = ref.read(projectListQueryNotifierProvider.notifier);
    if (query != null) {
      notifier.setQuery(query);
      // setQuery resets page to 1; preserve provided pageSize if given.
      notifier.setPageSize(pageSize);
    } else {
      notifier.setPage(page);
      notifier.setPageSize(pageSize);
    }
  }

  Future<void> setQuery(String value) async {
    ref.read(projectListQueryNotifierProvider.notifier).setQuery(value);
  }

  Future<void> goToPage(int newPage) async {
    ref.read(projectListQueryNotifierProvider.notifier).setPage(newPage);
  }
}
