import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

// Implementare gestione degli errori per immagini mancanti

class SwiperWithText extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> titles;

  const SwiperWithText({
    Key? key,
    required this.imagePaths,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      child: Swiper(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            child: Stack(
              children: [
                // Immagine di sfondo
                Container(
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
                  color: colors.imageOverlay,
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
                        style: textStyle.h2.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      Text(
                        "New Episode",
                        style: textStyle.h4.copyWith(
                          color: colors.textSecondary,
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
          margin: const EdgeInsets.only(
            left: 16,
            bottom: 16,
          ), // aggiusta il padding
        ),
        autoplay: true,
      ),
    );
  }
}
