import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
abstract class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    String? id,
    required String title,
    required List<String> pages,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);
}

