import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import 'package:shoppe_ui/features/Home/data/model/CarouselModel.dart';
import 'package:shoppe_ui/features/Home/data/model/CategoriesModel.dart';
import 'package:shoppe_ui/features/Product/data/model/ProductModel.dart';
import '../../data/repository/HomeRepository.dart';

part 'Home_event.dart';
part 'Home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(CarouselInitial()) {
    on<CarouselEvent>((event, emit) async {
      emit(CarouselLoading()); // إرسال حالة التحميل
      final failureOrData = await repository.carousel();

      failureOrData.fold(
            (failure) {
          log('Error: $failure');
          final errorMessage = mapFailureToMessage(failure);
          emit(CarouselError(errorMessage: errorMessage));
        },
            (data) {
          log('Success: $data');
          emit(CarouselLoaded(carouselModel: data));

            },
      );
    });


    // ######################################################

    on<CategoriesEvent>((event, emit) async {
      emit(CategoriesLoading() as HomeState); // إرسال حالة التحميل
      final failureOrData = await repository.categories();

      failureOrData.fold(
            (failure) {
          log('Error: $failure');
          final errorMessage = mapFailureToMessage(failure);
          emit(CategoriesError(errorMessage: errorMessage) as HomeState);
        },
            (data) {
          log('Success: $data');
          emit(CategoriesLoaded(categoriesModel: data));

        },
      );
    });


    // ######################################################

    on<FeaturedEvent>((event, emit) async {
      emit(FeaturedLoading() as HomeState); // إرسال حالة التحميل
      final failureOrData = await repository.featured();

      failureOrData.fold(
            (failure) {
          log('Error: $failure');
          final errorMessage = mapFailureToMessage(failure);
          emit(FeaturedError(errorMessage: errorMessage) as HomeState);
        },
            (data) {
          log('Success: $data');
          emit(FeaturedLoaded(productModel: data));

        },
      );
    });

  }
}