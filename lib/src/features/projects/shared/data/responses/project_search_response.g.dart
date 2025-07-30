// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectSearchResponse _$ProjectSearchResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectSearchResponse(
  items: (json['items'] as List<dynamic>)
      .map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total-count'] as num).toInt(),
);

Map<String, dynamic> _$ProjectSearchResponseToJson(
  _ProjectSearchResponse instance,
) => <String, dynamic>{
  'items': instance.items,
  'total-count': instance.totalCount,
};
