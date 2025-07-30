import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/utils.dart';

part 'project_details.freezed.dart';

part 'project_details.g.dart';

@freezed
abstract class ProjectDetails with _$ProjectDetails {
  const factory ProjectDetails({
    required String slug,
    required String title,
    required String description,
    @JsonKey(name: "image-url") String? imageUrl,
    @JsonKey(name: "created-date", fromJson: parseDate)
    required DateTime? createdDate,
  }) = _ProjectDetails;

  factory ProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsFromJson(json);
}
