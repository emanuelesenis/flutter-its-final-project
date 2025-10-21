import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class TutorialSwiper extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> titles;

  const TutorialSwiper({
    super.key,
    required this.imagePaths,
    required this.titles,
  });

  @override
  _TutorialSwiperState createState() => _TutorialSwiperState();
}

class _TutorialSwiperState extends State<TutorialSwiper> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Swiper per immagini
        Swiper(
          itemCount: widget.imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              widget.imagePaths[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
          autoplay: true, // Abilita autoplay
          //loop: true, // Abilita il loop
          onIndexChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          //TODO: gesitone dell'indice su un pagination custom
          /*pagination: SwiperPagination(
            alignment: Alignment.bottomCenter, // Posiziona i pallini
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.brown,
            ),
          ),*/
        ),
        // Testo sovrapposto
        Positioned(
          bottom:
              MediaQuery.of(context).size.height *
              0.35, // Posiziona sopra il box
          left: 16,
          right: 64,
          child: Text(
            widget.titles[currentIndex],
            style: context.textStyles.h3.copyWith(
              fontSize: 16,
              color: Theme.of(context).extension<AppColors>()!.textSecondary,
            ),
            //textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
