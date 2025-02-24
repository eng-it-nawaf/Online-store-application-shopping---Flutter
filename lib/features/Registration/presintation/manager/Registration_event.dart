part of 'Registration_bloc.dart';

abstract class RegistrationEvent {}

class SignUpEvent extends RegistrationEvent {
  final String username;
  final String email;
  final String password;

  SignUpEvent({required this.username, required this.email, required this.password});
}


// ######################################################

class LogInEvent extends RegistrationEvent {
  final String username;
  final String password;

  LogInEvent({required this.username, required this.password});
}

class GetLast10Registration extends RegistrationEvent {
  @override
  List<Object> get props => [];
}