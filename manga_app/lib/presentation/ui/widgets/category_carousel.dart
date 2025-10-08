import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  final String title;
  final List<Widget> cards;

  const CategoryCarousel({
    Key? key,
    required this.title,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title cartegory
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(title),
          
          )
      ],
    )
  }
  
}