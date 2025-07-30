// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectItem {

 String get slug; String get title; String get description;@JsonKey(name: "image-url") String? get imageUrl;@JsonKey(name: "created-date", fromJson: parseDate) DateTime? get createdDate;
/// Create a copy of ProjectItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectItemCopyWith<ProjectItem> get copyWith => _$ProjectItemCopyWithImpl<ProjectItem>(this as ProjectItem, _$identity);

  /// Serializes this ProjectItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectItem&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,description,imageUrl,createdDate);

@override
String toString() {
  return 'ProjectItem(slug: $slug, title: $title, description: $description, imageUrl: $imageUrl, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class $ProjectItemCopyWith<$Res>  {
  factory $ProjectItemCopyWith(ProjectItem value, $Res Function(ProjectItem) _then) = _$ProjectItemCopyWithImpl;
@useResult
$Res call({
 String slug, String title, String description,@JsonKey(name: "image-url") String? imageUrl,@JsonKey(name: "created-date", fromJson: parseDate) DateTime? createdDate
});




}
/// @nodoc
class _$ProjectItemCopyWithImpl<$Res>
    implements $ProjectItemCopyWith<$Res> {
  _$ProjectItemCopyWithImpl(this._self, this._then);

  final ProjectItem _self;
  final $Res Function(ProjectItem) _then;

/// Create a copy of ProjectItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? imageUrl = freezed,Object? createdDate = freezed,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectItem].
extension ProjectItemPatterns on ProjectItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectItem value)  $default,){
final _that = this;
switch (_that) {
case _ProjectItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String title,  String description, @JsonKey(name: "image-url")  String? imageUrl, @JsonKey(name: "created-date", fromJson: parseDate)  DateTime? createdDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectItem() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.imageUrl,_that.createdDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String title,  String description, @JsonKey(name: "image-url")  String? imageUrl, @JsonKey(name: "created-date", fromJson: parseDate)  DateTime? createdDate)  $default,) {final _that = this;
switch (_that) {
case _ProjectItem():
return $default(_that.slug,_that.title,_that.description,_that.imageUrl,_that.createdDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String title,  String description, @JsonKey(name: "image-url")  String? imageUrl, @JsonKey(name: "created-date", fromJson: parseDate)  DateTime? createdDate)?  $default,) {final _that = this;
switch (_that) {
case _ProjectItem() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.imageUrl,_that.createdDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectItem implements ProjectItem {
  const _ProjectItem({required this.slug, required this.title, required this.description, @JsonKey(name: "image-url") this.imageUrl, @JsonKey(name: "created-date", fromJson: parseDate) required this.createdDate});
  factory _ProjectItem.fromJson(Map<String, dynamic> json) => _$ProjectItemFromJson(json);

@override final  String slug;
@override final  String title;
@override final  String description;
@override@JsonKey(name: "image-url") final  String? imageUrl;
@override@JsonKey(name: "created-date", fromJson: parseDate) final  DateTime? createdDate;

/// Create a copy of ProjectItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectItemCopyWith<_ProjectItem> get copyWith => __$ProjectItemCopyWithImpl<_ProjectItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectItem&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,description,imageUrl,createdDate);

@override
String toString() {
  return 'ProjectItem(slug: $slug, title: $title, description: $description, imageUrl: $imageUrl, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class _$ProjectItemCopyWith<$Res> implements $ProjectItemCopyWith<$Res> {
  factory _$ProjectItemCopyWith(_ProjectItem value, $Res Function(_ProjectItem) _then) = __$ProjectItemCopyWithImpl;
@override @useResult
$Res call({
 String slug, String title, String description,@JsonKey(name: "image-url") String? imageUrl,@JsonKey(name: "created-date", fromJson: parseDate) DateTime? createdDate
});




}
/// @nodoc
class __$ProjectItemCopyWithImpl<$Res>
    implements _$ProjectItemCopyWith<$Res> {
  __$ProjectItemCopyWithImpl(this._self, this._then);

  final _ProjectItem _self;
  final $Res Function(_ProjectItem) _then;

/// Create a copy of ProjectItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? imageUrl = freezed,Object? createdDate = freezed,}) {
  return _then(_ProjectItem(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
