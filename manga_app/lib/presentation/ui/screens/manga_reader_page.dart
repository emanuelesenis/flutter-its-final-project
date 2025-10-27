import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/models/chapter/chapter_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/providers/providers.dart';

class MangaReaderPage extends StatefulWidget {
  final String mangaId;
  final String chapterId;

  const MangaReaderPage({
    super.key,
    required this.mangaId,
    required this.chapterId,
  });

  @override
  State<MangaReaderPage> createState() => _MangaReaderPageState();
}

class _MangaReaderPageState extends State<MangaReaderPage> {
  int _currentPageIndex = 0;
  late PageController _pageController;
  MangaModel? _manga;
  ChapterModel? _chapter;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _loadMangaData();
  }

  Future<void> _loadMangaData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Fetch manga data using the provided mangaId
      final mangaApi = getIt<MangaDexApi>();
      final mangas = await mangaApi.fetchFeaturedManga(limit: 50);

      if (mangas.isEmpty) {
        throw Exception('No mangas found');
      }

      // Find the manga with the matching ID
      final foundManga = mangas
          .where((manga) => manga.id == widget.mangaId)
          .firstOrNull;

      if (foundManga == null) {
        throw Exception('Manga with ID ${widget.mangaId} not found');
      }

      // Add sample chapters to the manga (similar to test_api.dart structure)
      final mangaWithChapters = foundManga.copyWith(
        chapters: [
          ChapterModel(
            id: '${foundManga.id}_chapter_1',
            title: 'Capitolo 1',
            pages: [
              'https://via.placeholder.com/800x1200/FF0000/FFFFFF?text=Page+1',
              'https://via.placeholder.com/800x1200/00FF00/FFFFFF?text=Page+2',
              'https://via.placeholder.com/800x1200/0000FF/FFFFFF?text=Page+3',
              'https://via.placeholder.com/800x1200/FFFF00/000000?text=Page+4',
              'https://via.placeholder.com/800x1200/FF00FF/FFFFFF?text=Page+5',
            ],
          ),
          ChapterModel(
            id: '${foundManga.id}_chapter_2',
            title: 'Capitolo 2',
            pages: [
              'https://via.placeholder.com/800x1200/00FFFF/000000?text=Page+1',
              'https://via.placeholder.com/800x1200/FF8000/FFFFFF?text=Page+2',
              'https://via.placeholder.com/800x1200/8000FF/FFFFFF?text=Page+3',
            ],
          ),
        ],
      );

      // Find the specific chapter
      final targetChapter = mangaWithChapters.chapters
          .where((chapter) => chapter.id == widget.chapterId)
          .firstOrNull;

      setState(() {
        _manga = mangaWithChapters;
        _chapter = targetChapter ?? mangaWithChapters.chapters.first;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Set fallback data with sample chapters
        _manga = MangaModel(
          id: widget.mangaId,
          title: 'Manga non trovato',
          cover: '',
          status: 'Non disponibile',
          description:
              'Impossibile caricare i dettagli del manga. Verifica la connessione e riprova.',
          rating: '',
          minimumAge: 14,
          tags: ['errore', 'non trovato'],
          chapters: [
            ChapterModel(
              id: '${widget.mangaId}_chapter_1',
              title: 'Capitolo Demo',
              pages: [
                'https://via.placeholder.com/800x1200/FF0000/FFFFFF?text=Demo+Page+1',
                'https://via.placeholder.com/800x1200/00FF00/FFFFFF?text=Demo+Page+2',
                'https://via.placeholder.com/800x1200/0000FF/FFFFFF?text=Demo+Page+3',
              ],
            ),
          ],
        );
        _chapter = _manga!.chapters.first;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      setState(() {
        _currentPageIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    if (_chapter != null && _currentPageIndex < _chapter!.pages.length - 1) {
      setState(() {
        _currentPageIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: AppBar(
          backgroundColor: colors.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colors.textPrimary),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
          title: Text(
            'Caricamento...',
            style: textStyle.h3.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_manga == null || _chapter == null) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: AppBar(
          backgroundColor: colors.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colors.textPrimary),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
          title: Text(
            'Errore',
            style: textStyle.h3.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: colors.textPrimary),
              const SizedBox(height: 16),
              Text(
                'Impossibile caricare il manga',
                style: textStyle.h3.copyWith(color: colors.textPrimary),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadMangaData,
                child: const Text('Riprova'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: colors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.textPrimary),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: Text(
          _manga!.title ?? 'Manga Title',
          style: textStyle.h3.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Main Content Area
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colors.textPrimary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _chapter!.pages.length,
                  itemBuilder: (context, index) {
                    // Using the correct data structure like in test_api.dart: mangas[2].chapters[0].pages[index]
                    final String imageUrl = _chapter!.pages[index];
                    if (kDebugMode) {
                      print('Loading page ${index + 1}: $imageUrl');
                    }
                    return PhotoView(
                      imageProvider: NetworkImage(imageUrl),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      initialScale: PhotoViewComputedScale.contained,
                      backgroundDecoration: BoxDecoration(
                        color: colors.backgroundColor,
                      ),
                      loadingBuilder: (context, event) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: colors.primaryColor,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Caricamento pagina...',
                              style: textStyle.body.copyWith(
                                color: colors.textPrimary.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: colors.textPrimary.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Errore nel caricamento dell\'immagine',
                              style: textStyle.body.copyWith(
                                color: colors.textPrimary.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Pagina ${index + 1}',
                              style: textStyle.body.copyWith(
                                color: colors.textPrimary.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Navigation Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: colors.backgroundColor,
              border: Border(
                top: BorderSide(
                  color: colors.textPrimary.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Page Button
                IconButton(
                  onPressed: _currentPageIndex > 0 ? _goToPreviousPage : null,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _currentPageIndex > 0
                        ? colors.textPrimary
                        : colors.textPrimary.withValues(alpha: 0.3),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: _currentPageIndex > 0
                        ? colors.primaryColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                // Page Counter
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Pag. ${_currentPageIndex + 1} di ${_chapter!.pages.length}',
                    style: textStyle.body.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Next Page Button
                IconButton(
                  onPressed: _currentPageIndex < _chapter!.pages.length - 1
                      ? _goToNextPage
                      : null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: _currentPageIndex < _chapter!.pages.length - 1
                        ? colors.textPrimary
                        : colors.textPrimary.withValues(alpha: 0.3),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor:
                        _currentPageIndex < _chapter!.pages.length - 1
                        ? colors.primaryColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
