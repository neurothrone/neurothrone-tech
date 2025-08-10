import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_list_query.freezed.dart';

@freezed
abstract class ProjectListQuery with _$ProjectListQuery {
  const factory ProjectListQuery({
    String? query,
    required int page,
    required int pageSize,
  }) = _ProjectListQuery;
}
