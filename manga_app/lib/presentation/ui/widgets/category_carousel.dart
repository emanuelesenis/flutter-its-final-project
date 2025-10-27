import 'package:flutter/material.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/manga_card.dart';
import 'package:manga_app/providers/providers.dart';

class CategoryCarousel extends StatefulWidget {
  const CategoryCarousel({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CategoryCarousel> createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  late final List<MangaModel> _mangas;

  @override
  void initState() {
    super.initState();
    _mangas = getIt<MangaDexApi>().mangas;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header categoria
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                widget.categoryName.toUpperCase(),
                style: context.textStyles.h2.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 180, // include card + titolo
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: _mangas.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final MangaModel manga = _mangas[index];
              return MangaCard(manga: manga);
            },
          ),
        ),
      ],
    );
  }
}
