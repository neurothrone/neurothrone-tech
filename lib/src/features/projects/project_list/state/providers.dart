import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/services/services.dart';
import '../../shared/state/providers.dart';
import 'project_list_provider.dart';
import 'project_list_state.dart';

final searchTextProvider = StateProvider<String>((ref) {
  return "";
});

final projectListProvider =
    StateNotifierProvider<ProjectListController, AsyncValue<ProjectListState>>((
      ref,
    ) {
      final ProjectNetworkService service = ref.watch(
        projectServiceProvider,
      );
      return ProjectListController(service: service);
    });
