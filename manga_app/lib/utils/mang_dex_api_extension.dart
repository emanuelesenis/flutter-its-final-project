import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';

extension MangaDexApiExtension on MangaDexApi {
  Future<List<MangaModel>> getAllMangas(int limit) async {
    return getIt<MangaDexApi>().fetchFeaturedManga(limit: limit);
  }
}
