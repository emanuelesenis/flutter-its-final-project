// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MangaModel _$MangaModelFromJson(Map<String, dynamic> json) => _MangaModel(
  id: json['id'] as String?,
  cover: json['cover'] as String,
  status: json['status'] as String,
  descrisione: json['descrisione'] as String,
  rating: (json['rating'] as num).toInt(),
  minimumAge: (json['minimumAge'] as num).toInt(),
);

Map<String, dynamic> _$MangaModelToJson(_MangaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'status': instance.status,
      'descrisione': instance.descrisione,
      'rating': instance.rating,
      'minimumAge': instance.minimumAge,
    };
