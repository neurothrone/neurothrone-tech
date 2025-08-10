// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListQuery {

 String? get query; int get page; int get pageSize;
/// Create a copy of ProjectListQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListQueryCopyWith<ProjectListQuery> get copyWith => _$ProjectListQueryCopyWithImpl<ProjectListQuery>(this as ProjectListQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListQuery&&(identical(other.query, query) || other.query == query)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,query,page,pageSize);

@override
String toString() {
  return 'ProjectListQuery(query: $query, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $ProjectListQueryCopyWith<$Res>  {
  factory $ProjectListQueryCopyWith(ProjectListQuery value, $Res Function(ProjectListQuery) _then) = _$ProjectListQueryCopyWithImpl;
@useResult
$Res call({
 String? query, int page, int pageSize
});




}
/// @nodoc
class _$ProjectListQueryCopyWithImpl<$Res>
    implements $ProjectListQueryCopyWith<$Res> {
  _$ProjectListQueryCopyWithImpl(this._self, this._then);

  final ProjectListQuery _self;
  final $Res Function(ProjectListQuery) _then;

/// Create a copy of ProjectListQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectListQuery].
extension ProjectListQueryPatterns on ProjectListQuery {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListQuery() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListQuery value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListQuery():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListQuery value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListQuery() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListQuery() when $default != null:
return $default(_that.query,_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _ProjectListQuery():
return $default(_that.query,_that.page,_that.pageSize);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListQuery() when $default != null:
return $default(_that.query,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectListQuery implements ProjectListQuery {
  const _ProjectListQuery({this.query, required this.page, required this.pageSize});
  

@override final  String? query;
@override final  int page;
@override final  int pageSize;

/// Create a copy of ProjectListQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListQueryCopyWith<_ProjectListQuery> get copyWith => __$ProjectListQueryCopyWithImpl<_ProjectListQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListQuery&&(identical(other.query, query) || other.query == query)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,query,page,pageSize);

@override
String toString() {
  return 'ProjectListQuery(query: $query, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$ProjectListQueryCopyWith<$Res> implements $ProjectListQueryCopyWith<$Res> {
  factory _$ProjectListQueryCopyWith(_ProjectListQuery value, $Res Function(_ProjectListQuery) _then) = __$ProjectListQueryCopyWithImpl;
@override @useResult
$Res call({
 String? query, int page, int pageSize
});




}
/// @nodoc
class __$ProjectListQueryCopyWithImpl<$Res>
    implements _$ProjectListQueryCopyWith<$Res> {
  __$ProjectListQueryCopyWithImpl(this._self, this._then);

  final _ProjectListQuery _self;
  final $Res Function(_ProjectListQuery) _then;

/// Create a copy of ProjectListQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_ProjectListQuery(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
