import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';
import 'package:manga_app/providers/providers.dart';

class TestApiCubit extends Cubit<List<MangaModel>> {
  TestApiCubit() : super([]);

  void getMangadexInfos() async {
    final updatedMangas = await getIt<MangaDexApi>().fetchFeaturedManga();
    emit(updatedMangas);
  }
}
