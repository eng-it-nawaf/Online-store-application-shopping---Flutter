part of 'Home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class CarouselInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class CarouselLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class CarouselLoaded extends HomeState {
  final List<CarouselModel> carouselModel;

  const CarouselLoaded({required this.carouselModel});

  @override
  List<Object> get props => [carouselModel];
}

class CarouselError extends HomeState {
  final String errorMessage;

  const CarouselError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


// ######################################################


class CategoriesInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class CategoriesLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends HomeState {

  final List<CategoriesModel> categoriesModel;

  const CategoriesLoaded({required this.categoriesModel});

  @override
  List<Object> get props => [categoriesModel];
}

class CategoriesError extends HomeState {
  final String errorMessage;

  const CategoriesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


// ###################### Featured ################################


class FeaturedInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class FeaturedLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class FeaturedLoaded extends HomeState {

  final List<ProductModel> productModel;

  const FeaturedLoaded({required this.productModel});

  @override
  List<Object> get props => [productModel];
}

class FeaturedError extends HomeState {
  final String errorMessage;

  const FeaturedError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
