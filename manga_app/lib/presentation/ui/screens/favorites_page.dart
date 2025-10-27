import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/bloc/favourite/favourite_bloc.dart';
import 'package:manga_app/bloc/favourite/favourite_event.dart';
import 'package:manga_app/bloc/favourite/favourite_state.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/manga_card.dart';
import 'package:manga_app/providers/providers.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final List<MangaModel> mangas;

  @override
  void initState() {
    super.initState();
    mangas = getIt<MangaDexApi>().mangas;
    context.read<FavouriteBloc>().add(GetFavourite());
  }

  @override
  Widget build(BuildContext context) {
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
              child: BlocBuilder<FavouriteBloc, FavouriteState>(
                builder: (context, state) {
                  if (state is FavouriteSuccess) {
                    final filteredMangas = mangas
                        .where((e) => state.favouriteMangas.contains(e.id))
                        .toList();
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                          ),
                      itemCount: state.favouriteMangas.length,
                      itemBuilder: (context, index) {
                        return MangaCard(manga: filteredMangas[index]);
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
