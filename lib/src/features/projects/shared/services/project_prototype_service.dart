import 'dart:convert'; // For json.decode

import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle; // For loading assets

import '../../../../core/utils/utils.dart';
import '../data/models/models.dart';
import '../data/responses/responses.dart';
import 'project_network_service.dart';

final class ProjectPrototypeService implements ProjectNetworkService {
  List<ProjectDetails> _projects = []; // In-memory list

  // Getter to access the projects
  List<ProjectDetails> get projects => _projects;

  // Method to load projects from the JSON asset
  Future<void> loadProjects() async {
    try {
      // 1. Load the JSON string from the asset
      //    Adjust the path if you used a subfolder like 'assets/data/projects.json'
      final String jsonString = await rootBundle.loadString(
        "assets/data/projects.json",
      );

      // 2. Decode the JSON string into a List<dynamic>
      //    (since the root of your JSON is an array)
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;

      // 3. Map the dynamic list to a List<ProjectDetails>
      _projects = jsonList
          .map(
            (jsonItem) =>
                ProjectDetails.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      _projects = []; // Ensure projects is empty on error
    }
  }

  @override
  Future<Result<ProjectSearchResponse, NetworkFailure>> searchProjects({
    int page = 1,
    int pageSize = 10,
    String? query,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    await loadProjects();

    try {
      // Filter projects based on the query
      query = query?.trim().toLowerCase();
      final filteredProjects = _projects.where((project) {
        return query == null || project.title.toLowerCase().contains(query);
      }).toList();

      // Calculate pagination
      final totalCount = filteredProjects.length;
      final startIndex = (page - 1) * pageSize;
      final endIndex = startIndex + pageSize;
      final paginatedProjects = filteredProjects.sublist(
        startIndex,
        endIndex.clamp(0, totalCount),
      );

      // Create the response
      final response = ProjectSearchResponse(
        items: paginatedProjects
            .map((p) => ProjectItem.fromDetails(p))
            .toList(),
        totalCount: totalCount,
      );

      return Result.success(value: response);
    } catch (_) {
      return Result.failure(error: NetworkFailure.unknownError);
    }
  }

  @override
  Future<Result<ProjectDetails?, NetworkFailure>> getBy({
    required String slug,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    await loadProjects();

    try {
      final project = _projects.firstWhereOrNull((p) => p.slug == slug);
      return Result.success(value: project);
    } catch (_) {
      return Result.failure(error: NetworkFailure.unknownError);
    }
  }
}
