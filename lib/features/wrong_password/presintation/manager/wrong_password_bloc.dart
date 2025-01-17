import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/wrong_password_event.dart';
import '../manager/wrong_password_state.dart';

class WrongPasswordBloc extends Bloc<WrongPasswordEvent, WrongPasswordState> {
  WrongPasswordBloc() : super(const WrongPasswordState()) {
    on<IncrementPasswordAttempt>((event, emit) {
      final newCount = state.attemptCount + 1;
      emit(state.copyWith(
        attemptCount: newCount,
        isLocked: newCount >= 3,  // Example lock condition
      ));
    });

    on<ResetPasswordAttempt>((event, emit) {
      emit(const WrongPasswordState());
    });
  }
}
