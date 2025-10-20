import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manga_app/presentation/ui/widgets/custom_fab.dart';
//import 'package:manga_app/presentation/ui/widgets/custom_fab.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/category_carousel.dart';
import 'package:manga_app/presentation/ui/widgets/swiper_with_text.dart';
import 'package:manga_app/presentation/ui/widgets/highlighted_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: CustomFab(),
      backgroundColor: context.colors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight:
                context.screenHeight *
                0.30, // Stessa altezza del SwiperWithText
            flexibleSpace: FlexibleSpaceBar(
              background: SwiperWithText(
                imagePaths: [
                  'assets/images/episode1.jpg',
                  'assets/images/episode2.jpg',
                  'assets/images/episode3.jpg',
                ],
                titles: ['Titolo Opera 1', 'Titolo Opera 2', 'Titolo Opera 3'],
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SvgPicture.asset(
                'assets/icons/app_logo.svg',
                colorFilter: ColorFilter.mode(
                  context.colors.textSecondary,
                  BlendMode.srcIn,
                ),
                width: 32,
                height: 32,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: context.colors.textSecondary,
                  size: 32,
                ),
                onPressed: () {
                  // Azione da eseguire quando si preme l'icona di ricerca
                  if (kDebugMode) {
                    print('Icona di ricerca premuta');
                  }
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const HighlightedSection(),
              CategoryCarousel(categoryName: "Popolari"),
              CategoryCarousel(categoryName: "Popolari"),
              CategoryCarousel(categoryName: "Popolari"),
              CategoryCarousel(categoryName: "Popolari"),
            ]),
          ),
        ],
      ),
    );
  }
}
