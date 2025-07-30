import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/utils.dart';

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
}
