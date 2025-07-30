import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/project_item.dart';

part 'project_search_response.freezed.dart';

part 'project_search_response.g.dart';

@freezed
abstract class ProjectSearchResponse with _$ProjectSearchResponse {
  const factory ProjectSearchResponse({
    required List<ProjectItem> items,
    @JsonKey(name: "total-count") required int totalCount,
  }) = _ProjectSearchResponse;

  factory ProjectSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectSearchResponseFromJson(json);
}
