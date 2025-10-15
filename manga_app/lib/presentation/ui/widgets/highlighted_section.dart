import 'package:flutter/material.dart';
import 'package:card_stack_swiper/card_stack_swiper.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class HighlightedSection extends StatefulWidget {
  const HighlightedSection({super.key});

  @override
  State<HighlightedSection> createState() => _HighlightedSectionState();
}

class _HighlightedSectionState extends State<HighlightedSection> {
  final CardStackSwiperController _controller = CardStackSwiperController();

  final List<Widget> _cards = [
    for (int i = 0; i < 10; i++)
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.primaries[i % Colors.primaries.length].shade300,
        child: Center(
          child: Text(
            'Card ${i + 1}',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'IN EVIDENZA',
                  style: context.textStyles.h2.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Vedi Tutto',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Immagine brush_circle centrata
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/brush_circle.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 128,
                  height: 182,
                  child: CardStackSwiper(
                    controller: _controller,
                    cardsCount: _cards.length,
                    initialIndex: 0,
                    isLoop: true,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      debugPrint(
                        'Swiped from $previousIndex to $currentIndex in $direction direction',
                      );
                      return true;
                    },
                    onEnd: () {
                      debugPrint('Reached end of the stack');
                    },
                    cardBuilder:
                        (
                          context,
                          index,
                          horizontalPercentage,
                          verticalPercentage,
                        ) {
                          return _cards[index];
                        },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
