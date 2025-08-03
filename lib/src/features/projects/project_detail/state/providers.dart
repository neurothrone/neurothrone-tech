import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/data/models/project_details.dart';
import '../../shared/services/services.dart';
import '../../shared/state/providers.dart';
import '../utils/utils.dart';

final projectDetailProvider = FutureProvider.autoDispose
    .family<ProjectDetails?, String>((ref, projectSlug) async {
      final ProjectNetworkService service = ref.read(projectServiceProvider);
      final result = await service.getBy(slug: projectSlug);
      return result.when(
        success: (project) => project,
        failure: (networkFailure) {
          // This is a generic "Error" case for other load failures
          throw ProjectLoadException(
            "Failed to load project details: ${networkFailure.message}",
            originalError: networkFailure,
          );
        },
      );
    });
