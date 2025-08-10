import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'project_list_query.dart';

class ProjectListQueryNotifier extends Notifier<ProjectListQuery> {
  @override
  ProjectListQuery build() =>
      const ProjectListQuery(query: null, page: 1, pageSize: 10);

  void setQuery(String value) {
    final trimmed = value.trim();
    state = state.copyWith(
      query: trimmed.isEmpty ? null : trimmed,
      page: 1, // reset to first page on new search
    );
  }

  void setPage(int newPage) {
    final p = newPage < 1 ? 1 : newPage;
    state = state.copyWith(page: p);
  }

  void setPageSize(int newSize) {
    final s = newSize < 1 ? 1 : newSize;
    state = state.copyWith(pageSize: s);
  }

  void setAll({String? query, int? page, int? pageSize}) {
    final q = query?.trim();
    state = ProjectListQuery(
      query: (q == null || q.isEmpty) ? state.query : q,
      page: page ?? state.page,
      pageSize: pageSize ?? state.pageSize,
    );
  }
}
