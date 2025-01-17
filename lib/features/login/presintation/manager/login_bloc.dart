import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import '../manager/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(email: '')) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}
