import 'package:equatable/equatable.dart';

abstract class StartEvent extends Equatable {
  const StartEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToCreateAccount extends StartEvent {}

class NavigateToLogin extends StartEvent {}

