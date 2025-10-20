import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/manga_card.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    // TODO: Lista di esempio
    final mangaList = List.generate(
      6,
      (index) => {
        'image': 'assets/images/episode${index + 1}.jpg',
        'title': 'Manga ${index + 1}',
      },
    );

    return Column(
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

        // ListView orizzontale delle card
        SizedBox(
          height: 180, // include card + titolo
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: mangaList.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final manga = mangaList[index];
              return MangaCard(
                // TODO: Sostituire con valori reali e rimuovere !
                imageUrl: manga['image']!,
                title: manga['title']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
