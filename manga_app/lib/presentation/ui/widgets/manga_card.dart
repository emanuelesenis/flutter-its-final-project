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
    final cardHeight = context.screenHeight * 0.18; // ≈ 153 su 852

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imageUrl),
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
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
