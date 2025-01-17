// lib/features/password/bloc/password_event.dart

abstract class PasswordEvent {}

class PasswordTyped extends PasswordEvent {
  final String password;

  PasswordTyped(this.password);
}
