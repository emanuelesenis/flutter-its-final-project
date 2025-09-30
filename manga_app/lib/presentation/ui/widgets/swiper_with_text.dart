import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

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
      height: 300,
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
                // Testo sovrapposto con padding
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: Text(
                    titles[index],
                    style: textStyle.h1.copyWith(color: colors.textSecondary),
                  ),
                ),
              ],
            ),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
