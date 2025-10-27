import 'package:bloc/bloc.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';

class MangaCubit extends Cubit<List<MangaModel>> {
  MangaCubit() : super([]);

  void filterMangas(String value) {
    final updatedMangas = getIt<MangaDexApi>().mangas
        .where(
          (manga) =>
              manga.title?.toLowerCase().contains(value.toLowerCase()) ?? false,
        )
        .toList();

    emit(updatedMangas);
  }
}
