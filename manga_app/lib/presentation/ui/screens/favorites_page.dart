import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/manga_favorite_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dati di esempio
    final List<Map<String, dynamic>> mangaList = [
      {
        'imageUrl': 'assets/images/tutorial1.png',
        'title': 'L\'attacco dei giganti',
        'chapter': 'Cap 1',
        'isFavorite': true,
      },
      {
        'imageUrl': 'assets/images/tutorial2.png',
        'title': 'Black Clover',
        'chapter': 'Cap 11',
        'isFavorite': true,
      },
      {
        'imageUrl': 'assets/images/tutorial3.png',
        'title': 'Chainsaw man',
        'chapter': 'Cap 30',
        'isFavorite': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: context.textStyles.h1.copyWith(
            color: Theme.of(context).extension<AppColors>()!.primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 245, 245, 0.9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).extension<AppColors>()!.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo di ricerca
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a title...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 16,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color.fromARGB(175, 176, 128, 128),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Lista dei preferiti
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                itemCount: mangaList.length,
                itemBuilder: (context, index) {
                  final manga = mangaList[index];
                  return MangaFavoriteCard(
                    imageUrl: manga['imageUrl'],
                    title: manga['title'],
                    chapter: manga['chapter'],
                    isFavorite: manga['isFavorite'],
                    onTap: () {
                      // Azione quando si tocca la card
                      //TODO: navigare alla pagina dei dettagli del manga
                    },
                    onFavoriteToggle: () {
                      // Azione quando si tocca il cuore
                      //TODO: implementare funzione di rimozione dai preferiti
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
