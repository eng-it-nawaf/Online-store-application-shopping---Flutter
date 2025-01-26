part of 'ProductDeatil_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {
  @override
  List<Object> get props => [];
}

class ProductDetailsLoading extends ProductDetailsState {
  @override
  List<Object> get props => [];
}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel; // تم تصحيح اسم الفئة
  ProductDetailsLoaded({required this.productDetailsModel});

  @override
  List<Object> get props => [productDetailsModel];
}

class ProductDetailsError extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}