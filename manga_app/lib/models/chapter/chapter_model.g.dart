// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) =>
    _ChapterModel(
      id: json['id'] as String?,
      title: json['title'] as String,
      pages: (json['pages'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChapterModelToJson(_ChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pages': instance.pages,
    };
