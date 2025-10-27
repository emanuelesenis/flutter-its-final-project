import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class MangaCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const MangaCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    // Usa le estensioni per accedere alle dimensioni dello schermo
    final cardWidth = context.screenWidth * 0.274; // ≈ 108 su 393
    final cardHeight = context.screenHeight * 0.15; // Ridotta altezza per evitare overflow

    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl), // Use NetworkImage for network URLs
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
          const SizedBox(height: 8),
          SizedBox(
            width: cardWidth,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.h4.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12, // Ridotto il font per adattare il titolo
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
