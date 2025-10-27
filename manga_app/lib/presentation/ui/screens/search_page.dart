import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/api/search_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/category_carousel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final SearchApi _searchApi = SearchApi();
  List<MangaModel> _searchResults = [];
  bool _isSearching = false;
  String _currentQuery = '';
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    // Preload some manga data for better search experience
    _preloadMangaData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _preloadMangaData() async {
    try {
      // Preload some manga data in the background
      await _searchApi.findRelatedMangas('a'); // This will cache some data
      print('Preloaded manga data for search');
    } catch (e) {
      print('Preload failed: $e');
      // This is fine, we'll handle it when user searches
    }
  }

  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _currentQuery = '';
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _currentQuery = query;
    });

    try {
      print('Searching for: $query');
      final results = await _searchApi.findRelatedMangas(query);
      print('Search results: ${results.length} items');

      // Print first few results for debugging
      for (int i = 0; i < results.length && i < 3; i++) {
        print('Result ${i + 1}: ${results[i].title}');
      }

      if (mounted) {
        setState(() {
          _searchResults = results;
          _isSearching = false;
        });

        // Show success message if we got results
        if (results.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Trovati ${results.length} risultati'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      print('Search error: $e');

      if (mounted) {
        setState(() {
          _searchResults = [];
          _isSearching = false;
        });

        String errorMessage = 'Errore nella ricerca';
        if (e.toString().contains('429')) {
          errorMessage =
              'Troppi tentativi di ricerca. Riprova tra qualche secondo.';
        } else if (e.toString().contains('network')) {
          errorMessage =
              'Errore di connessione. Controlla la tua connessione internet.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Riprova',
              onPressed: () => _performSearch(query),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Esplora")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 64),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Cerca un titolo',
                  suffixIcon: _isSearching
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(Icons.search),
                ),
                onSubmitted: _performSearch,
                onChanged: (value) {
                  // Cancel previous timer
                  _debounceTimer?.cancel();

                  // Start new timer for debounced search
                  if (value.length >= 2) {
                    _debounceTimer = Timer(
                      const Duration(milliseconds: 500),
                      () {
                        if (mounted && _searchController.text == value) {
                          _performSearch(value);
                        }
                      },
                    );
                  } else if (value.isEmpty) {
                    if (mounted) {
                      setState(() {
                        _searchResults = [];
                        _currentQuery = '';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 8,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 1"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 2"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 3"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),
                      onPressed: () => {},
                      child: Text("Categoria 4"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: context.textStyles.h4.color,
                      ),

                      onPressed: () => {},
                      child: Text("Categoria 5"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Search Results Section
              if (_currentQuery.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Risultati per "$_currentQuery"',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      Text(
                        '${_searchResults.length} risultati',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (_searchResults.isEmpty && !_isSearching)
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text('Nessun risultato trovato'),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final manga = _searchResults[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: manga.cover.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    manga.cover,
                                    width: 50,
                                    height: 70,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 50,
                                        height: 70,
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.image_not_supported,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  width: 50,
                                  height: 70,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.book),
                                ),
                          title: Text(manga.title ?? 'Titolo non disponibile'),
                          subtitle: Text(manga.status),
                          onTap: () {
                            // Navigate to manga details
                            context.go('/details/${manga.id}');
                          },
                        ),
                      );
                    },
                  ),
              ] else ...[
                // Default content when no search
                SizedBox(height: 64),
                CategoryCarousel(categoryName: "Popolari"),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
