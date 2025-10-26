import 'package:flutter/foundation.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';
import 'package:manga_app/utils/mang_dex_api_extension.dart';

class SearchApi {
  static final List<MangaModel> _cachedMangas = [];
  static DateTime? _lastCacheTime;
  static final List<MangaModel> _fallbackMangas = [
    MangaModel(
      id: 'demo-1',
      title: 'One Piece',
      cover: '',
      status: 'ongoing',
      description: 'Adventure manga about pirates',
      rating: 'safe',
      minimumAge: 10,
      tags: ['adventure', 'action'],
      chapters: [],
    ),
    MangaModel(
      id: 'demo-2',
      title: 'Naruto',
      cover: '',
      status: 'completed',
      description: 'Ninja adventure story',
      rating: 'safe',
      minimumAge: 10,
      tags: ['action', 'shounen'],
      chapters: [],
    ),
    MangaModel(
      id: 'demo-3',
      title: 'Attack on Titan',
      cover: '',
      status: 'completed',
      description: 'Dark fantasy about titans',
      rating: 'suggestive',
      minimumAge: 14,
      tags: ['dark', 'fantasy'],
      chapters: [],
    ),
    MangaModel(
      id: 'demo-4',
      title: 'Dragon Ball',
      cover: '',
      status: 'completed',
      description: 'Martial arts and adventure',
      rating: 'safe',
      minimumAge: 10,
      tags: ['action', 'martial arts'],
      chapters: [],
    ),
    MangaModel(
      id: 'demo-5',
      title: 'Demon Slayer',
      cover: '',
      status: 'completed',
      description: 'Supernatural action manga',
      rating: 'suggestive',
      minimumAge: 14,
      tags: ['supernatural', 'action'],
      chapters: [],
    ),
  ];

  Future<List<MangaModel>> findRelatedMangas(String searchQuery) async {
    // Only search if query is not empty and has at least 2 characters
    if (searchQuery.trim().isEmpty || searchQuery.trim().length < 2) {
      return [];
    }

    if (kDebugMode) {
      print('Searching for: $searchQuery');
    }

    // First try to get real API data
    try {
      // Use cached data if available and not too old (5 minutes)
      if (_cachedMangas.isNotEmpty &&
          _lastCacheTime != null &&
          DateTime.now().difference(_lastCacheTime!).inMinutes < 5) {
        if (kDebugMode) {
          print('Using cached data for search');
        }
        final results = _cachedMangas
            .where(
              (manga) =>
                  manga.title?.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ??
                  false,
            )
            .toList();

        if (results.isNotEmpty) {
          return results;
        }
      }

      // Try to fetch fresh data with timeout
      if (kDebugMode) {
        print('Fetching fresh data from API');
      }
      final mangas = await getIt<MangaDexApi>()
          .getAllMangas(20)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              if (kDebugMode) {
                print('API timeout, using fallback data');
              }
              return <MangaModel>[];
            },
          );

      if (mangas.isNotEmpty) {
        // Cache the results
        _cachedMangas.clear();
        _cachedMangas.addAll(mangas);
        _lastCacheTime = DateTime.now();

        final results = mangas
            .where(
              (manga) =>
                  manga.title?.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ??
                  false,
            )
            .toList();

        if (results.isNotEmpty) {
          if (kDebugMode) {
            print('Found ${results.length} real API results');
          }
          return results;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Search API error: $e');
      }
    }

    // If we have cached data, use it even if it's old
    if (_cachedMangas.isNotEmpty) {
      if (kDebugMode) {
        print('Using old cached data due to API error');
      }
      final results = _cachedMangas
          .where(
            (manga) =>
                manga.title?.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ??
                false,
          )
          .toList();

      if (results.isNotEmpty) {
        return results;
      }
    }

    // Final fallback: use demo data
    if (kDebugMode) {
      print('Using fallback demo data');
    }
    return _fallbackMangas
        .where(
          (manga) =>
              manga.title?.toLowerCase().contains(searchQuery.toLowerCase()) ??
              false,
        )
        .toList();
  }
}
