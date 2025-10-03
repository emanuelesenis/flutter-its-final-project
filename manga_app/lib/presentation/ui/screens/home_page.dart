import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';
import 'package:manga_app/presentation/ui/widgets/swiper_with_text.dart';
import 'package:manga_app/presentation/ui/widgets/highlighted_section.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manga_app/presentation/ui/widgets/app_bar_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Scaffold(
      backgroundColor: colors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarHome(
        showSearch: true,
        onSearch: () {
          // Azione da eseguire quando si preme l'icona di ricerca
          print('Icona di ricerca premuta');
        },
      ),
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
            ],
          ),
          const HighlightedSection(),
          // Spazio per contenuto futuro
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
