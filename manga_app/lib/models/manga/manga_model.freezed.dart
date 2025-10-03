// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MangaModel implements DiagnosticableTreeMixin {

 String? get id; String get cover; String get status; String get descrisione; int get rating; int get minimumAge;
/// Create a copy of MangaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaModelCopyWith<MangaModel> get copyWith => _$MangaModelCopyWithImpl<MangaModel>(this as MangaModel, _$identity);

  /// Serializes this MangaModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MangaModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cover', cover))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('descrisione', descrisione))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('minimumAge', minimumAge));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.status, status) || other.status == status)&&(identical(other.descrisione, descrisione) || other.descrisione == descrisione)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cover,status,descrisione,rating,minimumAge);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MangaModel(id: $id, cover: $cover, status: $status, descrisione: $descrisione, rating: $rating, minimumAge: $minimumAge)';
}


}

/// @nodoc
abstract mixin class $MangaModelCopyWith<$Res>  {
  factory $MangaModelCopyWith(MangaModel value, $Res Function(MangaModel) _then) = _$MangaModelCopyWithImpl;
@useResult
$Res call({
 String? id, String cover, String status, String descrisione, int rating, int minimumAge
});




}
/// @nodoc
class _$MangaModelCopyWithImpl<$Res>
    implements $MangaModelCopyWith<$Res> {
  _$MangaModelCopyWithImpl(this._self, this._then);

  final MangaModel _self;
  final $Res Function(MangaModel) _then;

/// Create a copy of MangaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? cover = null,Object? status = null,Object? descrisione = null,Object? rating = null,Object? minimumAge = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,descrisione: null == descrisione ? _self.descrisione : descrisione // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,minimumAge: null == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaModel].
extension MangaModelPatterns on MangaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaModel value)  $default,){
final _that = this;
switch (_that) {
case _MangaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MangaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String cover,  String status,  String descrisione,  int rating,  int minimumAge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaModel() when $default != null:
return $default(_that.id,_that.cover,_that.status,_that.descrisione,_that.rating,_that.minimumAge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String cover,  String status,  String descrisione,  int rating,  int minimumAge)  $default,) {final _that = this;
switch (_that) {
case _MangaModel():
return $default(_that.id,_that.cover,_that.status,_that.descrisione,_that.rating,_that.minimumAge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String cover,  String status,  String descrisione,  int rating,  int minimumAge)?  $default,) {final _that = this;
switch (_that) {
case _MangaModel() when $default != null:
return $default(_that.id,_that.cover,_that.status,_that.descrisione,_that.rating,_that.minimumAge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaModel with DiagnosticableTreeMixin implements MangaModel {
  const _MangaModel({this.id, required this.cover, required this.status, required this.descrisione, required this.rating, required this.minimumAge});
  factory _MangaModel.fromJson(Map<String, dynamic> json) => _$MangaModelFromJson(json);

@override final  String? id;
@override final  String cover;
@override final  String status;
@override final  String descrisione;
@override final  int rating;
@override final  int minimumAge;

/// Create a copy of MangaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaModelCopyWith<_MangaModel> get copyWith => __$MangaModelCopyWithImpl<_MangaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MangaModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cover', cover))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('descrisione', descrisione))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('minimumAge', minimumAge));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.status, status) || other.status == status)&&(identical(other.descrisione, descrisione) || other.descrisione == descrisione)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cover,status,descrisione,rating,minimumAge);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MangaModel(id: $id, cover: $cover, status: $status, descrisione: $descrisione, rating: $rating, minimumAge: $minimumAge)';
}


}

/// @nodoc
abstract mixin class _$MangaModelCopyWith<$Res> implements $MangaModelCopyWith<$Res> {
  factory _$MangaModelCopyWith(_MangaModel value, $Res Function(_MangaModel) _then) = __$MangaModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String cover, String status, String descrisione, int rating, int minimumAge
});




}
/// @nodoc
class __$MangaModelCopyWithImpl<$Res>
    implements _$MangaModelCopyWith<$Res> {
  __$MangaModelCopyWithImpl(this._self, this._then);

  final _MangaModel _self;
  final $Res Function(_MangaModel) _then;

/// Create a copy of MangaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? cover = null,Object? status = null,Object? descrisione = null,Object? rating = null,Object? minimumAge = null,}) {
  return _then(_MangaModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,descrisione: null == descrisione ? _self.descrisione : descrisione // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,minimumAge: null == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
