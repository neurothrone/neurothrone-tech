// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectDetails {

 String get slug; String get title; String get description;@JsonKey(name: "image-url") String? get imageUrl;@JsonKey(name: "created-date", fromJson: parseDate) DateTime? get createdDate;
/// Create a copy of ProjectDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailsCopyWith<ProjectDetails> get copyWith => _$ProjectDetailsCopyWithImpl<ProjectDetails>(this as ProjectDetails, _$identity);

  /// Serializes this ProjectDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetails&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,description,imageUrl,createdDate);

@override
String toString() {
  return 'ProjectDetails(slug: $slug, title: $title, description: $description, imageUrl: $imageUrl, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailsCopyWith<$Res>  {
  factory $ProjectDetailsCopyWith(ProjectDetails value, $Res Function(ProjectDetails) _then) = _$ProjectDetailsCopyWithImpl;
@useResult
$Res call({
 String slug, String title, String description,@JsonKey(name: "image-url") String? imageUrl,@JsonKey(name: "created-date", fromJson: parseDate) DateTime? createdDate
});




}
/// @nodoc
class _$ProjectDetailsCopyWithImpl<$Res>
    implements $ProjectDetailsCopyWith<$Res> {
  _$ProjectDetailsCopyWithImpl(this._self, this._then);

  final ProjectDetails _self;
  final $Res Function(ProjectDetails) _then;

/// Create a copy of ProjectDetails
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


/// Adds pattern-matching-related methods to [ProjectDetails].
extension ProjectDetailsPatterns on ProjectDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetails value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetails() when $default != null:
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
case _ProjectDetails() when $default != null:
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
case _ProjectDetails():
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
case _ProjectDetails() when $default != null:
return $default(_that.slug,_that.title,_that.description,_that.imageUrl,_that.createdDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectDetails implements ProjectDetails {
  const _ProjectDetails({required this.slug, required this.title, required this.description, @JsonKey(name: "image-url") this.imageUrl, @JsonKey(name: "created-date", fromJson: parseDate) required this.createdDate});
  factory _ProjectDetails.fromJson(Map<String, dynamic> json) => _$ProjectDetailsFromJson(json);

@override final  String slug;
@override final  String title;
@override final  String description;
@override@JsonKey(name: "image-url") final  String? imageUrl;
@override@JsonKey(name: "created-date", fromJson: parseDate) final  DateTime? createdDate;

/// Create a copy of ProjectDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailsCopyWith<_ProjectDetails> get copyWith => __$ProjectDetailsCopyWithImpl<_ProjectDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetails&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,description,imageUrl,createdDate);

@override
String toString() {
  return 'ProjectDetails(slug: $slug, title: $title, description: $description, imageUrl: $imageUrl, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailsCopyWith<$Res> implements $ProjectDetailsCopyWith<$Res> {
  factory _$ProjectDetailsCopyWith(_ProjectDetails value, $Res Function(_ProjectDetails) _then) = __$ProjectDetailsCopyWithImpl;
@override @useResult
$Res call({
 String slug, String title, String description,@JsonKey(name: "image-url") String? imageUrl,@JsonKey(name: "created-date", fromJson: parseDate) DateTime? createdDate
});




}
/// @nodoc
class __$ProjectDetailsCopyWithImpl<$Res>
    implements _$ProjectDetailsCopyWith<$Res> {
  __$ProjectDetailsCopyWithImpl(this._self, this._then);

  final _ProjectDetails _self;
  final $Res Function(_ProjectDetails) _then;

/// Create a copy of ProjectDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? description = null,Object? imageUrl = freezed,Object? createdDate = freezed,}) {
  return _then(_ProjectDetails(
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
