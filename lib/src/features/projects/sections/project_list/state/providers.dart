import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/project_view_mode.dart';
import 'project_list_notifier.dart';
import 'project_list_state.dart';

final searchTextStateProvider = StateProvider<String>((ref) {
  return "";
});

final projectViewModeStateProvider = StateProvider<ProjectViewMode>(
  (ref) => ProjectViewMode.list,
);

final projectListNotifierProvider =
    AsyncNotifierProvider.autoDispose<ProjectListNotifier, ProjectListState>(
      ProjectListNotifier.new,
    );
