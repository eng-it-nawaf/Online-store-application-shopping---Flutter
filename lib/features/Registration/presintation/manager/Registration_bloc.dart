import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppe_ui/dataProviders/error/failures.dart';
import '../../data/repository/RegistrationRepository.dart';
import 'package:shoppe_ui/features/Registration/data/model/RegistrationModel.dart';

part 'Registration_event.dart';
part 'Registration_state.dart';


class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository repository;

  RegistrationBloc({required this.repository}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoading()); // Sending loading state
      final failureOrData = await repository.signUp(
        event.username,
        event.email,
        event.password,
      );

      failureOrData.fold(
            (failure) {
          log('Error: $failure');
          final errorMessage = mapFailureToMessage(failure);
          emit(SignUpError(errorMessage: errorMessage));

          // emit(SignUpError(errorMessage: mapFailureToMessage(failure)));
        },
            (data) {
          // log('Loaded successfully: $data');
              log('Success: $data');
          emit(SignUpLoaded(registrationModel: [data])); // Assuming it's a single data item to wrap in a list
        },
      );
    });

    // ######################################################

    on<LogInEvent>((event, emit) async {
      emit(LogInLoading()); // Sending loading state
      final failureOrData = await repository.logIn(
        event.username,
        event.password,
      );

      failureOrData.fold(
            (failure) {
          log('Error: $failure');
          final errorMessage = mapFailureToMessage(failure);
          emit(LogInError(errorMessage: errorMessage));

          // emit(SignUpError(errorMessage: mapFailureToMessage(failure)));
        },
            (data) {
          // log('Loaded successfully: $data');
          log('Success: $data');
          emit(LogInLoaded(registrationModel: [data])); // Assuming it's a single data item to wrap in a list
        },
      );
    });
  }
}
