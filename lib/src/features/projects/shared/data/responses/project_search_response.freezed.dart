// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectSearchResponse {

 List<ProjectItem> get items;@JsonKey(name: "total-count") int get totalCount;
/// Create a copy of ProjectSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSearchResponseCopyWith<ProjectSearchResponse> get copyWith => _$ProjectSearchResponseCopyWithImpl<ProjectSearchResponse>(this as ProjectSearchResponse, _$identity);

  /// Serializes this ProjectSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSearchResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount);

@override
String toString() {
  return 'ProjectSearchResponse(items: $items, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $ProjectSearchResponseCopyWith<$Res>  {
  factory $ProjectSearchResponseCopyWith(ProjectSearchResponse value, $Res Function(ProjectSearchResponse) _then) = _$ProjectSearchResponseCopyWithImpl;
@useResult
$Res call({
 List<ProjectItem> items,@JsonKey(name: "total-count") int totalCount
});




}
/// @nodoc
class _$ProjectSearchResponseCopyWithImpl<$Res>
    implements $ProjectSearchResponseCopyWith<$Res> {
  _$ProjectSearchResponseCopyWithImpl(this._self, this._then);

  final ProjectSearchResponse _self;
  final $Res Function(ProjectSearchResponse) _then;

/// Create a copy of ProjectSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProjectItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectSearchResponse].
extension ProjectSearchResponsePatterns on ProjectSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectSearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProjectSearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectSearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectItem> items, @JsonKey(name: "total-count")  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectSearchResponse() when $default != null:
return $default(_that.items,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectItem> items, @JsonKey(name: "total-count")  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _ProjectSearchResponse():
return $default(_that.items,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectItem> items, @JsonKey(name: "total-count")  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _ProjectSearchResponse() when $default != null:
return $default(_that.items,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectSearchResponse implements ProjectSearchResponse {
  const _ProjectSearchResponse({required final  List<ProjectItem> items, @JsonKey(name: "total-count") required this.totalCount}): _items = items;
  factory _ProjectSearchResponse.fromJson(Map<String, dynamic> json) => _$ProjectSearchResponseFromJson(json);

 final  List<ProjectItem> _items;
@override List<ProjectItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: "total-count") final  int totalCount;

/// Create a copy of ProjectSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectSearchResponseCopyWith<_ProjectSearchResponse> get copyWith => __$ProjectSearchResponseCopyWithImpl<_ProjectSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectSearchResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount);

@override
String toString() {
  return 'ProjectSearchResponse(items: $items, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$ProjectSearchResponseCopyWith<$Res> implements $ProjectSearchResponseCopyWith<$Res> {
  factory _$ProjectSearchResponseCopyWith(_ProjectSearchResponse value, $Res Function(_ProjectSearchResponse) _then) = __$ProjectSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectItem> items,@JsonKey(name: "total-count") int totalCount
});




}
/// @nodoc
class __$ProjectSearchResponseCopyWithImpl<$Res>
    implements _$ProjectSearchResponseCopyWith<$Res> {
  __$ProjectSearchResponseCopyWithImpl(this._self, this._then);

  final _ProjectSearchResponse _self;
  final $Res Function(_ProjectSearchResponse) _then;

/// Create a copy of ProjectSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,}) {
  return _then(_ProjectSearchResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProjectItem>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
