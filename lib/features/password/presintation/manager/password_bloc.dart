import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/password_event.dart';
import '../manager/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(const PasswordState()) {
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordSubmitted>(_onPasswordSubmitted);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<PasswordState> emit) {
    // Example: Handle password change logic
    emit(state.copyWith(currentPassword: event.passwordDigits.join()));
  }

  void _onPasswordSubmitted(PasswordSubmitted event, Emitter<PasswordState> emit) {
    // Handle password validation logic
    const correctPassword = "1234";
    if (event.submittedPassword == correctPassword) {
      emit(state.copyWith(isPasswordValid: true, showError: false));
    } else {
      emit(state.copyWith(showError: true));
    }
  }
}
