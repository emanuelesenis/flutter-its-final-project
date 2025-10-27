import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/manga/manga_cubit.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
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
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
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
                  onChanged: (value) {
                    context.read<MangaCubit>().filterMangas(value);
                  },
                ),
              ),
              SizedBox(height: 16),

              BlocBuilder<MangaCubit, List<MangaModel>>(
                builder: (context, state) {
                  // Search Results Section
                  if (state.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              if (_searchController.text.isNotEmpty)
                                Text(
                                  'Risultati per "${_searchController.text}"',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              const Spacer(),
                              Text(
                                '${state.length} risultati',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: ListTile(
                                  leading: state[index].cover.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.network(
                                            state[index].cover,
                                            width: 50,
                                            height: 70,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    width: 50,
                                                    height: 70,
                                                    color: Colors.grey[300],
                                                    child: const Icon(
                                                      Icons.image_not_supported,
                                                    ),
                                                  );
                                                },
                                          ),
                                        )
                                      : Container(
                                          width: 50,
                                          height: 70,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.book),
                                        ),
                                  title: Text(
                                    state[index].title ??
                                        'Titolo non disponibile',
                                  ),
                                  subtitle: Text(state[index].status),
                                  onTap: () {
                                    // Navigate to manga details
                                    context.go('/details/${state[index].id}');
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('Nessun risultato trovato'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
