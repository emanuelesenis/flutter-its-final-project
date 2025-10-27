import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultItem extends StatelessWidget {
  final String mangaId;
  const SearchResultItem({super.key, required this.mangaId});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 8,
        children: [
          Image.network('https://via.placeholder.com/150'),
          const Text('Titolo'),
          const Text('Descrizione'),
          TextButton(
            onPressed: () {
              context.go('/details/$mangaId');
            },
            child: const Text('Vai al dettaglio'),
          ),
        ],
      ),
    );
  }
}