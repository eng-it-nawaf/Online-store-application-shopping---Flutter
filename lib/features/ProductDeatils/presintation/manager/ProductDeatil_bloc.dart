import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import '../../data/repository/ProductDeatilRepository.dart';
import 'package:shoppe_ui/features/ProductDeatils/data/model/ProductDeatilModel.dart';

part 'ProductDeatil_event.dart';
part 'ProductDeatil_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailRepository repository;

  ProductDetailsBloc({required this.repository}) : super(ProductDetailsInitial()) {
    // تسجيل معالج للحدث GetAllProductDetails
    on<GetAllProductDetails>((event, emit) async {
      emit(ProductDetailsLoading()); // إرسال حالة التحميل
      final failureOrData = await repository.getAllProductDeatils(event.id);

      failureOrData.fold(
            (failure) {
          log('yield is error');
          emit(ProductDetailsError(errorMessage: mapFailureToMessage(failure)));
        },
            (data) {
          log('yield is loaded');
          emit(ProductDetailsLoaded(productDetailsModel: data));
        },
      );
    });
  }
}