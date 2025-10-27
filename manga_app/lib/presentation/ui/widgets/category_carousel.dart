import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/category_carousel_bloc.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/manga_card.dart';
import 'package:manga_app/api/manga_api.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCarouselBloc(mangaDexApi: MangaDexApi())
        ..add(CategoryCarouselLoad(categoryName: categoryName)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header categoria
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  categoryName.toUpperCase(),
                  style: context.textStyles.h2.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const Spacer(),
                Text(
                  'Vedi Tutto',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // BlocBuilder to handle states
          BlocBuilder<CategoryCarouselBloc, CategoryCarouselState>(
            builder: (context, state) {
              if (state is CategoryCarouselLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoryCarouselLoaded) {
                return SizedBox(
                  height: 180, // include card + titolo
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: state.mangaList.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final MangaModel manga = state.mangaList[index];
                      return MangaCard(
                        manga: manga,
                      );
                    },
                  ),
                );
              } else if (state is CategoryCarouselError) {
                return Center(
                  child: Text(
                    'Errore: ${state.message}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
