part of 'category_carousel_bloc.dart';

abstract class CategoryCarouselEvent {}

class CategoryCarouselLoad extends CategoryCarouselEvent {
  final String? categoryName;

  CategoryCarouselLoad({this.categoryName});
}