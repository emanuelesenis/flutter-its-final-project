import 'package:dio/dio.dart';
import 'package:manga_app/models/chapter/chapter_model.dart';
import 'package:manga_app/models/manga/manga_model.dart';

class MangaDexApi {
  final Dio _dio;

  MangaDexApi({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: 'https://api.mangadex.org',
              headers: {'Accept': 'application/json'},
            ));

  Future<List<MangaModel>> fetchFeaturedManga({int limit = 3}) async {
    final resp = await _dio.get('/manga', queryParameters: {
      'limit': limit.toString(),
      'order[followedCount]': 'desc',
      'includes[]': 'cover_art',
    });

    if (resp.statusCode != 200) {
      throw Exception('Errore HTTP: ${resp.statusCode}');
    }

    final mangaList = resp.data['data'] as List;
    final List<MangaModel> result = [];

    for (final mangaEntry in mangaList) {
      final mangaId = mangaEntry['id'];
      final attr = mangaEntry['attributes'] ?? {};

      // Copertina
      String coverUrl = '';
      for (final rel in mangaEntry['relationships'] ?? []) {
        if (rel['type'] == 'cover_art') {
          final fileName = rel['attributes']?['fileName'];
          if (fileName != null) {
            coverUrl = 'https://uploads.mangadex.org/covers/$mangaId/$fileName';
          }
          break;
        }
      }

      // Capitoli
      final chapters = await fetchChaptersForManga(mangaId);

      result.add(MangaModel(
        id: mangaId,
        cover: coverUrl,
        status: attr['status'] ?? 'unknown',
        descrisione: attr['description']?['en'] ?? '',
        rating: 0, // MangaDex non fornisce rating numerico
        minimumAge: 0, // Non fornito dall’API
        chapters: chapters,
      ));
    }

    return result;
  }

  Future<List<ChapterModel>> fetchChaptersForManga(String mangaId) async {
    final resp = await _dio.get('/chapter', queryParameters: {
      'manga': mangaId,
      'limit': '5',
      'order[chapter]': 'asc',
      'translatedLanguage[]': 'en',
    });

    if (resp.statusCode != 200) {
      throw Exception('Errore HTTP capitoli: ${resp.statusCode}');
    }

    final chapterList = resp.data['data'] as List;
    final List<ChapterModel> result = [];

    for (final ce in chapterList) {
      final chapterId = ce['id'];
      final attr = ce['attributes'] ?? {};
      final title = attr['title'] ?? 'No title';

      final pages = await fetchChapterPages(chapterId);

      result.add(ChapterModel(
        id: chapterId,
        title: title,
        pages: pages,
      ));
    }

    return result;
  }

  Future<List<String>> fetchChapterPages(String chapterId) async {
    final resp = await _dio.get('/at-home/server/$chapterId?forcePort443=false');

    if (resp.statusCode != 200) {
      throw Exception('Errore HTTP pagine: ${resp.statusCode}');
    }

    final data = resp.data;
    final baseUrl = data['baseUrl'];
    final hash = data['chapter']['hash'];
    final List files = data['chapter']['data'];

    return files
        .map<String>((fileName) => '$baseUrl/data/$hash/$fileName')
        .toList();
  }
}

