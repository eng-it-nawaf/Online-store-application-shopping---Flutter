import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import '../../data/repository/ProductRepository.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';

part 'Product_event.dart';
part 'Product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    // Register the event handler for GetAllProduct
    on<GetAllProduct>((event, emit) async {
      emit(ProductLoading());
      final failureOrData = await repository.getAllProduct();

      failureOrData.fold(
            (failure) {
          log('Error occurred: ${failure.toString()}');
          emit(ProductError(errorMessage: mapFailureToMessage(failure)));
        },
            (data) {
          log('Products loaded successfully.');
          emit(ProductLoaded(productModel: data));
        },
      );
    });
  }
}
