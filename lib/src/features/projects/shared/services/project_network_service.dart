import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import '../data/responses/responses.dart';

abstract interface class ProjectNetworkService {
  Future<Result<ProjectSearchResponse, NetworkFailure>> searchProjects({
    int page = 1,
    int pageSize = 10,
    String? query,
  });

  Future<Result<ProjectDetails?, NetworkFailure>> getBy({
    required String slug,
  });
}
