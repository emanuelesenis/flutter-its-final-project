import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/favourite/favourite_event.dart';
import 'package:manga_app/bloc/favourite/favourite_state.dart';
import 'package:manga_app/firebase/firebase_auth_service.dart';
import 'package:manga_app/firebase/firestore_service.dart';
import 'package:manga_app/providers/providers.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<GetFavourite>((event, emit) async {
      emit(FavouriteLoading());
      final userId = getIt<FirebaseAuthService>().getCurrentUserId();
      if (userId != null) {
        final favouriteMangas = await getIt<FirestoreService>()
            .getFavouriteMangas(userId);
        emit(FavouriteSuccess(favouriteMangas: favouriteMangas));
      } else {
        emit(FavouriteFailure());
      }
    });

    on<UpdateFavourite>((event, emit) async {
      emit(FavouriteLoading());
      final userId = getIt<FirebaseAuthService>().getCurrentUserId();
      if (userId != null) {
        final isLiked = await getIt<FirestoreService>().updateFavouriteMangas(
          userId,
          event.mangaId,
        );
        emit(FavouriteSuccess(isLiked: isLiked));
      } else {
        emit(FavouriteFailure());
      }
    });

    on<CheckFavourite>((event, emit) async {
      emit(FavouriteLoading());
      final userId = getIt<FirebaseAuthService>().getCurrentUserId();
      if (userId != null) {
        final isLiked = await getIt<FirestoreService>().checkFavouriteMangas(
          userId,
          event.mangaId,
        );
        emit(FavouriteSuccess(isLiked: isLiked));
      } else {
        emit(FavouriteFailure());
      }
    });
  }
}
