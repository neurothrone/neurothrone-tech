import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/networking/networking.dart';
import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import '../data/responses/responses.dart';
import 'project_network_service.dart';

class ProjectApiService extends DioNetworkService
    implements ProjectNetworkService {
  ProjectApiService({
    required super.baseApiUrl,
    super.showDebugInfo,
  });

  /// Searches projects.
  ///
  /// Possible status codes from backend:
  /// - 200 OK: Success
  /// - 400 Bad Request: Invalid query parameters
  @override
  Future<Result<ProjectSearchResponse, NetworkFailure>> searchProjects({
    int page = 1,
    int pageSize = 10,
    String? query,
  }) async {
    final Map<String, dynamic> queryParameters = {
      "page": page,
      "size": pageSize,
    };
    if (query != null && query.isNotEmpty) {
      queryParameters["query"] = query;
    }

    try {
      final response = await dio.get(
        "/projects",
        queryParameters: queryParameters,
      );

      if (response.statusCode == HttpStatus.ok) {
        final searchResponse = ProjectSearchResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        return Result.success(value: searchResponse);
      }

      return Result.failure(
        error: NetworkFailure.fromStatusCode(response.statusCode),
      );
    } on DioException catch (e) {
      return Result.failure(error: mapDioExceptionToNetworkFailure(e));
    } catch (e) {
      return Result.failure(error: NetworkFailure.unknownError);
    }
  }

  /// Gets project details by slug.
  ///
  /// Possible status codes from backend:
  /// - 200 OK: Success
  /// - 404 Not Found: Project not found
  @override
  Future<Result<ProjectDetails?, NetworkFailure>> getBy({
    required String slug,
  }) async {
    try {
      final response = await dio.get(
        "/projects/details",
        queryParameters: {"slug": slug},
      );
      if (response.statusCode == HttpStatus.ok) {
        final project = ProjectDetails.fromJson(
          response.data as Map<String, dynamic>,
        );
        return Result.success(value: project);
      }

      return Result.failure(
        error: NetworkFailure.fromStatusCode(response.statusCode),
      );
    } on DioException catch (e) {
      return Result.failure(error: mapDioExceptionToNetworkFailure(e));
    } catch (e) {
      return Result.failure(error: NetworkFailure.unknownError);
    }
  }
}
