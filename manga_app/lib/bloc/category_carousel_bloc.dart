import 'package:bloc/bloc.dart';
import 'package:manga_app/api/manga_api.dart';
import 'package:manga_app/models/manga/manga_model.dart';

part 'category_carousel_event.dart';
part 'category_carousel_state.dart';

class CategoryCarouselBloc extends Bloc<CategoryCarouselEvent, CategoryCarouselState> {
  final MangaDexApi mangaDexApi;

  CategoryCarouselBloc({required this.mangaDexApi}) : super(CategoryCarouselInitial()) {
    on<CategoryCarouselLoad>((event, emit) async {
      emit(CategoryCarouselLoading());
      try {
        final mangaList = await mangaDexApi.fetchFeaturedManga(limit: 10);
        emit(CategoryCarouselLoaded(mangaList: mangaList));
      } catch (e) {
        emit(CategoryCarouselError(message: e.toString()));
      }
    });
  }
}