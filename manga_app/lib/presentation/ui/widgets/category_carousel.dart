import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  final String title;
  final List<Widget> cards;

  const CategoryCarousel({
    super.key,
    required this.title,
    required this.cards,
  });

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
    );
  }
}