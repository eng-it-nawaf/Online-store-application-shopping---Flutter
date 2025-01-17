part of 'Product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProduct extends ProductEvent {
  const GetAllProduct();

  @override
  List<Object> get props => [];
}
