// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MangaModel _$MangaModelFromJson(Map<String, dynamic> json) => _MangaModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  cover: json['cover'] as String? ?? "",
  status: json['status'] as String? ?? "unknown",
  description: json['description'] as String? ?? "",
  rating: json['rating'] as String? ?? "",
  minimumAge: (json['minimumAge'] as num?)?.toInt() ?? 0,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  chapters:
      (json['chapters'] as List<dynamic>?)
          ?.map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  releaseYear: json['releaseYear'] as String? ?? "",
);

Map<String, dynamic> _$MangaModelToJson(_MangaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'status': instance.status,
      'description': instance.description,
      'rating': instance.rating,
      'minimumAge': instance.minimumAge,
      'tags': instance.tags,
      'chapters': instance.chapters,
      'releaseYear': instance.releaseYear,
    };
