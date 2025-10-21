import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';
import 'package:manga_app/utils/mang_dex_api_extension.dart';

class SearchApi {
  Future<List<MangaModel>> findRelatedMangas(String searchQuery) async {
    final mangas = await getIt<MangaDexApi>().getAllMangas(10);
    return mangas;
    //todo: waiting for title
  }
}
