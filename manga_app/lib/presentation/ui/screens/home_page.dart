import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';
import 'package:manga_app/presentation/ui/widgets/swiper_with_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: Column(
        children: [
          // Stack con lo swiper e le icone
          Stack(
            children: [
              SwiperWithText(
                imagePaths: [
                  'assets/images/episode1.jpg',
                  'assets/images/episode2.jpg',
                  'assets/images/episode3.jpg',
                ],
                titles: ['Titolo Opera 1', 'Titolo Opera 2', 'Titolo Opera 3'],
              ),
              // Logo dell'app in alto a sinistra
              Positioned(
                top: 16,
                left: 24,
                child: SafeArea(
                  child: Container(
                    width: 32,
                    height: 32,
                    child: SvgPicture.asset(
                      'assets/icons/app_logo.svg',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ),
              // Icona di ricerca
              Positioned(
                top: 16,
                right: 24,
                child: SafeArea(
                  child: Container(
                    width: 32,
                    height: 32,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colors.textSecondary,
                        size: 28,
                      ),
                      onPressed: () {
                        // TODO: Implementare la funzionalità di ricerca
                        print('Search pressed');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Sezione "IN EVIDENZA"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'IN EVIDENZA',
                style: textStyle.h2.copyWith(color: colors.textPrimary),
              ),
            ),
          ),
          // Immagine brush_circle centrata
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Image.asset(
                'assets/images/brush_circle.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Spazio per contenuto futuro
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
