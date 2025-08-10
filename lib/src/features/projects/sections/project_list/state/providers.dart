import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/project_view_mode.dart';
import 'project_list_notifier.dart';
import 'project_list_query.dart';
import 'project_list_query_notifier.dart';
import 'project_list_state.dart';

final projectViewModeStateProvider = StateProvider<ProjectViewMode>(
  (ref) => ProjectViewMode.list,
);

final projectListNotifierProvider =
    AsyncNotifierProvider.autoDispose<ProjectListNotifier, ProjectListState>(
      ProjectListNotifier.new,
    );

final projectListQueryNotifierProvider =
    NotifierProvider<ProjectListQueryNotifier, ProjectListQuery>(
      ProjectListQueryNotifier.new,
    );
