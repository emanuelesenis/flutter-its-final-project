import 'package:flutter/material.dart';
import 'package:card_stack_swiper/card_stack_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/category_carousel_bloc.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/api/manga_api.dart';

class HighlightedSection extends StatefulWidget {
  const HighlightedSection({super.key});

  @override
  State<HighlightedSection> createState() => _HighlightedSectionState();
}

class _HighlightedSectionState extends State<HighlightedSection> {
  final CardStackSwiperController _controller = CardStackSwiperController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCarouselBloc(mangaDexApi: MangaDexApi())
            ..add(CategoryCarouselLoad()),
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'IN EVIDENZA',
                    style: context.textStyles.h2.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
                ),
                const Spacer(),
                Align(alignment: Alignment.centerRight),
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
                  BlocBuilder<CategoryCarouselBloc, CategoryCarouselState>(
                    builder: (context, state) {
                      if (state is CategoryCarouselLoading) {
                        return SizedBox(
                          width: 128,
                          height: 182,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is CategoryCarouselLoaded) {
                        return SizedBox(
                          width: 128,
                          height: 182,
                          child: CardStackSwiper(
                            controller: _controller,
                            cardsCount: state.mangaList.length,
                            initialIndex: 0,
                            isLoop: true,
                            onPressed: (index) {
                              context.push(
                                '/details/${state.mangaList[index].id}',
                              );
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
                                  final MangaModel manga =
                                      state.mangaList[index];
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
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                        );
                      } else if (state is CategoryCarouselError) {
                        return SizedBox(
                          width: 128,
                          height: 182,
                          child: Center(
                            child: Text(
                              'Errore: ${state.message}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
