import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/models/chapter/chapter_model.dart';
import 'package:manga_app/presentation/ui/screens/details_page/pegi_section.dart';
import 'package:manga_app/presentation/ui/screens/details_page/tags_section.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/providers/providers.dart';

class DetailsPage extends StatefulWidget {
  final String? mangaId;

  const DetailsPage({super.key, required this.mangaId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = false;
  MangaModel? _manga;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

      // Add sample chapters to the manga
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

      setState(() {
        _manga = mangaWithChapters;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Set fallback data with sample chapters
        _manga = MangaModel(
          id: widget.mangaId ?? 'demo',
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
              id: '${widget.mangaId ?? 'demo'}_chapter_1',
              title: 'Capitolo Demo',
              pages: [
                'https://via.placeholder.com/800x1200/FF0000/FFFFFF?text=Demo+Page+1',
                'https://via.placeholder.com/800x1200/00FF00/FFFFFF?text=Demo+Page+2',
                'https://via.placeholder.com/800x1200/0000FF/FFFFFF?text=Demo+Page+3',
              ],
            ),
          ],
        );
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/search');
              }
            },
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_manga == null) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/search');
              }
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64),
              const SizedBox(height: 16),
              Text('Errore nel caricamento del manga'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _loadMangaData, child: Text('Riprova')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/search');
            }
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24, top: 8),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section with Cover Image
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: _manga!.cover.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(_manga!.cover),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {
                        // Handle image load error
                      },
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/images/episode1.jpg'),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    BeOffset(
                      offset: const Offset(0, 80),
                      child: Row(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Manga Cover
                          Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: _manga!.cover.isNotEmpty
                                  ? Image.network(
                                      _manga!.cover,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/episode1.jpg',
                                              fit: BoxFit.cover,
                                            );
                                          },
                                    )
                                  : Image.asset(
                                      'assets/images/episode1.jpg',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          // Title and Metadata
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _manga?.title?.toUpperCase() ??
                                      'TITOLO NON DISPONIBILE',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle.h1.copyWith(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _manga!.status.toUpperCase(),
                                  style: textStyle.body.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tab Bar
                  ],
                ),
              ),
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Details Tab
                _buildDetailsTab(context),
                // Chapters Tab
                _buildChaptersTab(context),
                // Similar Tab
                _buildSimilarTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chapter Button and Rating
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(right: 64),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Navigate to manga reader with the first chapter
                        if (_manga!.chapters.isNotEmpty) {
                          context.push(
                            '/reader/${_manga!.id}/${_manga!.chapters[0].id}',
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nessun capitolo disponibile'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: colors.backgroundColor,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'start reading',
                              style: textStyle.h4.copyWith(
                                color: colors.backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Age Rating and Stars
              PegiSection(rating: _manga!.minimumAge),
            ],
          ),
          const SizedBox(height: 32),
          // Tags Section
          TagsSection(tags: _manga!.tags),

          const SizedBox(height: 32),
          Text(
            _manga!.description.contains('---')
                ? _manga!.description.substring(
                    0,
                    _manga!.description.indexOf('---'),
                  )
                : _manga!.description,
            style: textStyle.body.copyWith(
              color: colors.textPrimary,
              height: 1.6,
              fontSize: 16,
            ),
          ),
          if (widget.mangaId != null && kDebugMode) ...[
            const SizedBox(height: 24),
            Text(
              'ID: ${widget.mangaId}',
              style: textStyle.body.copyWith(
                color: colors.textPrimary.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChaptersTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: textStyle.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              'Capitolo ${index + 1}',
              style: textStyle.h4.copyWith(color: colors.textPrimary),
            ),
            subtitle: Text(
              'Pubblicato il ${DateTime.now().subtract(Duration(days: index * 7)).day}/${DateTime.now().month}/${DateTime.now().year}',
              style: textStyle.body.copyWith(
                color: colors.textPrimary.withValues(alpha: 0.6),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Apertura Capitolo ${index + 1}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSimilarTab(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return GridView.builder(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final titles = [
          'One Piece',
          'Naruto',
          'Dragon Ball',
          'Demon Slayer',
          'My Hero Academia',
          'Jujutsu Kaisen',
        ];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.book,
                      size: 40,
                      color: colors.primaryColor.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[index],
                        style: textStyle.h4.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: colors.primaryColor,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4.${index + 1}',
                            style: textStyle.body.copyWith(
                              color: colors.textPrimary.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
