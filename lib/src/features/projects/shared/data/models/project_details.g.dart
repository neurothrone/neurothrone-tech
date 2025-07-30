// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDetails _$ProjectDetailsFromJson(Map<String, dynamic> json) =>
    _ProjectDetails(
      slug: json['slug'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image-url'] as String?,
      createdDate: parseDate(json['created-date'] as String?),
    );

Map<String, dynamic> _$ProjectDetailsToJson(_ProjectDetails instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'description': instance.description,
      'image-url': instance.imageUrl,
      'created-date': instance.createdDate?.toIso8601String(),
    };
