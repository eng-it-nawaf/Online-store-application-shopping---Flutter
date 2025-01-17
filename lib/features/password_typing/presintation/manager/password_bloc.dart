// lib/features/password/bloc/password_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/password_event.dart';
import '../manager/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is PasswordTyped) {
      yield PasswordUpdated(length: event.password.length);
    }
  }
}
