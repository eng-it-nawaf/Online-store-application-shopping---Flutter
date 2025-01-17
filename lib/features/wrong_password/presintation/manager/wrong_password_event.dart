import 'package:equatable/equatable.dart';

abstract class WrongPasswordEvent extends Equatable {
  const WrongPasswordEvent();

  @override
  List<Object> get props => [];
}

class IncrementPasswordAttempt extends WrongPasswordEvent {}

class ResetPasswordAttempt extends WrongPasswordEvent {}
