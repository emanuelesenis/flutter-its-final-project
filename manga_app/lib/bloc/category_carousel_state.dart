part of 'category_carousel_bloc.dart';

abstract class CategoryCarouselState {}

class CategoryCarouselInitial extends CategoryCarouselState {}

class CategoryCarouselLoading extends CategoryCarouselState {}

class CategoryCarouselLoaded extends CategoryCarouselState {
  final List<dynamic> mangaList;

  CategoryCarouselLoaded({required this.mangaList});
}

class CategoryCarouselError extends CategoryCarouselState {
  final String message;

  CategoryCarouselError({required this.message});
}