part of 'Home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class CarouselEvent extends HomeEvent {

  @override
  List<Object> get props => [];

  const CarouselEvent();
}

// ######################################################

class CategoriesEvent extends HomeEvent {

  @override
  List<Object> get props => [];

  const CategoriesEvent();
}

// ######################################################

class FeaturedEvent extends HomeEvent {

  @override
  List<Object> get props => [];

  const FeaturedEvent();
}