import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:manga_app/models/chapter/chapter_model.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
abstract class MangaModel with _$MangaModel {
  const factory MangaModel({
    String? id,
    String? title,
    @Default("") String cover,
    @Default("") String status,
    @Default("") String description,
    @Default("") String rating,
    @Default(0) int minimumAge,
    @Default([]) List<String> tags,
    @Default([]) List<ChapterModel> chapters,
  }) = _MangaModel;

  factory MangaModel.fromJson(Map<String, dynamic> json) =>
      _$MangaModelFromJson(json);
}
