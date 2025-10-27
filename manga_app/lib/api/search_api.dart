import 'package:flutter/foundation.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';

class SearchApi {
  static final List<MangaModel> _cachedMangas = [];
  static DateTime? _lastCacheTime;

  Future<List<MangaModel>> findRelatedMangas(String searchQuery) async {
    // Only search if query is not empty and has at least 2 characters
    if (searchQuery.trim().isEmpty || searchQuery.trim().length < 2) {
      return <MangaModel>[];
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
          .fetchFeaturedManga(limit: 10)
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
    return <MangaModel>[];
  }
}
