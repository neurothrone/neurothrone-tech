// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectItem _$ProjectItemFromJson(Map<String, dynamic> json) => _ProjectItem(
  slug: json['slug'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['image-url'] as String?,
  createdDate: parseDate(json['created-date'] as String?),
);

Map<String, dynamic> _$ProjectItemToJson(_ProjectItem instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'image-url': instance.imageUrl,
      'created-date': instance.createdDate?.toIso8601String(),
    };
