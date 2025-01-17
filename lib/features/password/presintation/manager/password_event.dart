import 'package:equatable/equatable.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class PasswordChanged extends PasswordEvent {
  final List<String> passwordDigits;

  const PasswordChanged(this.passwordDigits);

  @override
  List<Object> get props => [passwordDigits];
}

class PasswordSubmitted extends PasswordEvent {
  final String submittedPassword;

  const PasswordSubmitted(this.submittedPassword);

  @override
  List<Object> get props => [submittedPassword];
}
