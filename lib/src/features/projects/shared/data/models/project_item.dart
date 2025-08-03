import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/utils.dart';
import 'project_details.dart';

part 'project_item.freezed.dart';

part 'project_item.g.dart';

@freezed
abstract class ProjectItem with _$ProjectItem {
  const factory ProjectItem({
    required String slug,
    required String title,
    required String description,
    @JsonKey(name: "image-url") String? imageUrl,
    @JsonKey(name: "created-date", fromJson: parseDate)
    required DateTime? createdDate,
  }) = _ProjectItem;

  factory ProjectItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemFromJson(json);

  factory ProjectItem.fromDetails(ProjectDetails details) => ProjectItem(
    slug: details.slug,
    title: details.title,
    description: details.description,
    imageUrl: details.imageUrl,
    createdDate: details.createdDate,
  );
}
