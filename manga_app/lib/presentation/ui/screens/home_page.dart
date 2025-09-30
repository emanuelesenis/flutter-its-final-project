import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/widgets/swiper_with_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: Stack(
        children: [
          SwiperWithText(
            imagePaths: [
              'assets/images/episode1.jpg',
              'assets/images/episode2.jpg',
              'assets/images/episode3.jpg',
            ],
            titles: ['Titolo Opera 1', 'Titolo Opera 2', 'Titolo Opera 3'],
          ),
          // Icona di ricerca in alto a destra
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
                    size: 32,
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
    );
  }
}
