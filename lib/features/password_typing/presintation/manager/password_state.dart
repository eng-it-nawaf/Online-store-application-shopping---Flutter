// lib/features/password/bloc/password_state.dart

abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class PasswordUpdated extends PasswordState {
  final int length;

  PasswordUpdated({required this.length});
}
