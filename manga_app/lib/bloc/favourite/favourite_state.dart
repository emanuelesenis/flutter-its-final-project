sealed class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final bool? isLiked;
  final List<String>? favouriteMangas;

  FavouriteSuccess({this.isLiked, this.favouriteMangas});
}

class FavouriteFailure extends FavouriteState {}
