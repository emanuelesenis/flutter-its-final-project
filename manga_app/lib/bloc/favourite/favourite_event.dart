sealed class FavouriteEvent {}

class UpdateFavourite extends FavouriteEvent {
  final String mangaId;

  UpdateFavourite({required this.mangaId});
}

class CheckFavourite extends FavouriteEvent {
  final String mangaId;

  CheckFavourite({required this.mangaId});
}
