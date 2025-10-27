import 'package:card_stack_swiper/card_stack_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/providers/providers.dart';

class HighlightedSection extends StatefulWidget {
  const HighlightedSection({super.key});

  @override
  State<HighlightedSection> createState() => _HighlightedSectionState();
}

class _HighlightedSectionState extends State<HighlightedSection> {
  final CardStackSwiperController _controller = CardStackSwiperController();
  late final List<MangaModel> _mangas;

  @override
  void initState() {
    super.initState();
    _mangas = getIt<MangaDexApi>().mangas;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HIGHLIGHT',
                  style: context.textStyles.h2.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        // Immagine brush_circle centrata
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/brush_circle.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 128,
                  height: 182,
                  child: CardStackSwiper(
                    controller: _controller,
                    cardsCount: _mangas.length,
                    initialIndex: 0,
                    isLoop: true,
                    onPressed: (index) {
                      context.push('/details/${_mangas[index].id}');
                    },
                    onSwipe: (previousIndex, currentIndex, direction) {
                      debugPrint(
                        'Swiped from $previousIndex to $currentIndex in $direction direction',
                      );
                      return true;
                    },
                    onEnd: () {
                      debugPrint('Reached end of the stack');
                    },
                    cardBuilder:
                        (
                          context,
                          index,
                          horizontalPercentage,
                          verticalPercentage,
                        ) {
                          final MangaModel manga = _mangas[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                manga.cover,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
