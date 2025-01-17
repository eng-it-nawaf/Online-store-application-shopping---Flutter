import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginSubmitted extends LoginEvent {
  final String email;

  const LoginSubmitted(this.email);

  @override
  List<Object?> get props => [email];
}
