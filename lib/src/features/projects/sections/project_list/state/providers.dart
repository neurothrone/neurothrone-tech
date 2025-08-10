import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/services/services.dart';
import '../../../shared/state/providers.dart';
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
    StateNotifierProvider<ProjectListNotifier, AsyncValue<ProjectListState>>((
      ref,
    ) {
      final ProjectNetworkService service = ref.read(
        projectServiceProvider,
      );
      return ProjectListNotifier(service: service);
    });
