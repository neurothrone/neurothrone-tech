import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/services/services.dart';
import '../../shared/state/providers.dart';
import '../domain/project_view_mode.dart';
import 'project_list_controller.dart';
import 'project_list_state.dart';

final searchTextProvider = StateProvider<String>((ref) {
  return "";
});

final projectViewModeProvider = StateProvider<ProjectViewMode>(
  (ref) => ProjectViewMode.list,
);

final projectListProvider =
    StateNotifierProvider<ProjectListController, AsyncValue<ProjectListState>>((
      ref,
    ) {
      final ProjectNetworkService service = ref.read(
        projectServiceProvider,
      );
      return ProjectListController(service: service);
    });
