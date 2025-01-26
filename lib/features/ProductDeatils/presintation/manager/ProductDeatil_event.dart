part of 'ProductDeatil_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class GetAllProductDetails extends ProductDetailsEvent {
  final String id;
  @override
  List<Object> get props => [id]; // تضمين `id` في props للتحقق من المساواة
  const GetAllProductDetails({required this.id});
}

class GetLast10ProductDetails extends ProductDetailsEvent {
  @override
  List<Object> get props => [];
}