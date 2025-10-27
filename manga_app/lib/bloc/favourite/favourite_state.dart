sealed class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  bool isLiked;
  List<String> favouriteMangas;

  FavouriteSuccess({this.isLiked = false, this.favouriteMangas = const []});
}

class FavouriteFailure extends FavouriteState {}
