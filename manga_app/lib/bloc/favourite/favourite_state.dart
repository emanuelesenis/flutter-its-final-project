sealed class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final bool isLiked;

  FavouriteSuccess({required this.isLiked});
}

class FavouriteFailure extends FavouriteState {}
