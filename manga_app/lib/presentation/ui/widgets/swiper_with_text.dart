import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

// Implementare gestione degli errori per immagini mancanti

class SwiperWithText extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> titles;
  final double? height;
  final double? width;

  const SwiperWithText({
    super.key,
    required this.imagePaths,
    required this.titles,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.screenHeight * 0.30,
      width: width ?? double.infinity,
      child: Swiper(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                // Immagine di sfondo
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                        titles[index],
                        style: context.textStyles.h2.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      Text(
                        "New Episode",
                        style: context.textStyles.h4.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
  }
}
