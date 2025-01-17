import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/start_event.dart';
import '../manager/start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(const StartState()) {
    on<NavigateToCreateAccount>((event, emit) {
      emit(state.copyWith(isNavigatingToCreateAccount: true));
    });

    on<NavigateToLogin>((event, emit) {
      emit(state.copyWith(isNavigatingToLogin: true));
    });
  }
}
