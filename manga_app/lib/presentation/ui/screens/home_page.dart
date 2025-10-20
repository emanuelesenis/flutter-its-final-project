import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/widgets/custom_fab.dart';
//import 'package:manga_app/presentation/ui/widgets/custom_fab.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/category_carousel.dart';
import 'package:manga_app/presentation/ui/widgets/swiper_with_text.dart';
import 'package:manga_app/presentation/ui/widgets/highlighted_section.dart';
import 'package:manga_app/presentation/ui/widgets/app_bar_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: CustomFab(),
      backgroundColor: context.colors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarHome(
        showSearch: true,
        onSearch: () {
          // Azione da eseguire quando si preme l'icona di ricerca
          context.push('/search');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  titles: [
                    'Titolo Opera 1',
                    'Titolo Opera 2',
                    'Titolo Opera 3',
                  ],
                ),
              ],
            ),
            const HighlightedSection(),
            CategoryCarousel(categoryName: "Popolari"),
          ],
        ),
      ),
    );
  }
}

