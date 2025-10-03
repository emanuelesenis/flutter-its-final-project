
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
abstract class MangaModel with _$MangaModel {
  const factory MangaModel({
    String? id,
    required String cover,
    required String status,
    required String descrisione,
    required int rating,
    required int minimumAge,
  }) = _MangaModel;

  factory MangaModel.fromJson(Map<String, dynamic> json) => _$MangaModelFromJson(json); 
}
