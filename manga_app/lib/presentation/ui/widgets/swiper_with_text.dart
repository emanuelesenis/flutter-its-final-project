import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/category_carousel_bloc.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/api/manga_api.dart';

class SwiperWithText extends StatelessWidget {
  final double? height;
  final double? width;

  const SwiperWithText({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCarouselBloc(mangaDexApi: MangaDexApi())
            ..add(CategoryCarouselLoad()),
      child: BlocBuilder<CategoryCarouselBloc, CategoryCarouselState>(
        builder: (context, state) {
          if (state is CategoryCarouselLoading) {
            return SizedBox(
              height: height ?? context.screenHeight * 0.30,
              width: width ?? double.infinity,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is CategoryCarouselLoaded) {
            // Take only the first 3 items from the manga list
            final List<MangaModel> mangaList = state.mangaList
                .cast<MangaModel>()
                .take(3)
                .toList();

            return SizedBox(
              height: height ?? context.screenHeight * 0.30,
              width: width ?? double.infinity,
              child: Swiper(
                itemCount: mangaList.length,
                itemBuilder: (BuildContext context, int index) {
                  final MangaModel manga = mangaList[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/details/${manga.id}');
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          // Immagine di sfondo
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              manga.cover,
                              fit: BoxFit.cover,
                              width: double.infinity,
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
                          // Filtro colorato sopra l'immagine
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: context.colors.imageOverlay,
                          ),
                          // Testo sovrapposto all'immagine
                          Positioned(
                            bottom: 32,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  manga.title ?? 'TITOLO NON DISPONIBILE',
                                  style: context.textStyles.h2.copyWith(
                                    color: context.colors.textSecondary,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  manga.status,
                                  style: context.textStyles.h4.copyWith(
                                    color: context.colors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                pagination: SwiperPagination(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 16, bottom: 16),
                ),
                autoplay: true,
                loop: true,
              ),
            );
          } else if (state is CategoryCarouselError) {
            return SizedBox(
              height: height ?? context.screenHeight * 0.30,
              width: width ?? double.infinity,
              child: Center(
                child: Text(
                  'Errore: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
