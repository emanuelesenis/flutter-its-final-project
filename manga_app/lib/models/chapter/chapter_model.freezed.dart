// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterModel implements DiagnosticableTreeMixin {

 String? get id; String get title; List<String> get pages;
/// Create a copy of ChapterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterModelCopyWith<ChapterModel> get copyWith => _$ChapterModelCopyWithImpl<ChapterModel>(this as ChapterModel, _$identity);

  /// Serializes this ChapterModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChapterModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('pages', pages));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.pages, pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(pages));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChapterModel(id: $id, title: $title, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $ChapterModelCopyWith<$Res>  {
  factory $ChapterModelCopyWith(ChapterModel value, $Res Function(ChapterModel) _then) = _$ChapterModelCopyWithImpl;
@useResult
$Res call({
 String? id, String title, List<String> pages
});




}
/// @nodoc
class _$ChapterModelCopyWithImpl<$Res>
    implements $ChapterModelCopyWith<$Res> {
  _$ChapterModelCopyWithImpl(this._self, this._then);

  final ChapterModel _self;
  final $Res Function(ChapterModel) _then;

/// Create a copy of ChapterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? pages = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterModel].
extension ChapterModelPatterns on ChapterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterModel value)  $default,){
final _that = this;
switch (_that) {
case _ChapterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  List<String> pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterModel() when $default != null:
return $default(_that.id,_that.title,_that.pages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  List<String> pages)  $default,) {final _that = this;
switch (_that) {
case _ChapterModel():
return $default(_that.id,_that.title,_that.pages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  List<String> pages)?  $default,) {final _that = this;
switch (_that) {
case _ChapterModel() when $default != null:
return $default(_that.id,_that.title,_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterModel with DiagnosticableTreeMixin implements ChapterModel {
  const _ChapterModel({this.id, required this.title, required final  List<String> pages}): _pages = pages;
  factory _ChapterModel.fromJson(Map<String, dynamic> json) => _$ChapterModelFromJson(json);

@override final  String? id;
@override final  String title;
 final  List<String> _pages;
@override List<String> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of ChapterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterModelCopyWith<_ChapterModel> get copyWith => __$ChapterModelCopyWithImpl<_ChapterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChapterModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('pages', pages));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._pages, _pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_pages));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChapterModel(id: $id, title: $title, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$ChapterModelCopyWith<$Res> implements $ChapterModelCopyWith<$Res> {
  factory _$ChapterModelCopyWith(_ChapterModel value, $Res Function(_ChapterModel) _then) = __$ChapterModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, List<String> pages
});




}
/// @nodoc
class __$ChapterModelCopyWithImpl<$Res>
    implements _$ChapterModelCopyWith<$Res> {
  __$ChapterModelCopyWithImpl(this._self, this._then);

  final _ChapterModel _self;
  final $Res Function(_ChapterModel) _then;

/// Create a copy of ChapterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? pages = null,}) {
  return _then(_ChapterModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
