part of 'Product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> productModel;

  const ProductLoaded({required this.productModel});

  @override
  List<Object> get props => [productModel];
}

class ProductError extends ProductState {
  final String errorMessage;

  const ProductError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
