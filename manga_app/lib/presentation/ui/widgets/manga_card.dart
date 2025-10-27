import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class MangaCard extends StatelessWidget {
  final MangaModel manga;

  const MangaCard({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    // Usa le estensioni per accedere alle dimensioni dello schermo
    final cardWidth = context.screenWidth * 0.274; // ≈ 108 su 393
    final cardHeight =
        context.screenHeight * 0.15; // Ridotta altezza per evitare overflow

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            context.push('/details/${manga.id}');
          },
          child: Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  manga.cover,
                ), // Use NetworkImage for network URLs
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: cardWidth,
          child: Text(
            manga.title ?? 'No Title',
            textAlign: TextAlign.center,
            style: context.textStyles.h4.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12, // Ridotto il font per adattare il titolo
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
