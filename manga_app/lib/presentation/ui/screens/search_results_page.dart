import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/widgets/search_result_item.dart';

class SearchResultsPage extends StatelessWidget {
  final String searchedTitle;
  SearchResultsPage({super.key, required this.searchedTitle}) : assert(searchedTitle.isNotEmpty, 'Il titolo di ricerca non può essere vuoto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Risultati della ricerca'),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            Text('Risultati della ricerca per: $searchedTitle'),
            SearchResultItem(mangaId: '1'),
          ],
        ),
      ),
    );
  }
}