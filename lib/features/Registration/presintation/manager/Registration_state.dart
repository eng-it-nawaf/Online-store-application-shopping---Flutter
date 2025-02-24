part of 'Registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class SignUpInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class SignUpLoaded extends RegistrationState {
  final List<RegistrationModel> registrationModel;

  const SignUpLoaded({required this.registrationModel});

  @override
  List<Object> get props => [registrationModel];  // تعديل هنا ليكون registrationModel
}

class SignUpError extends RegistrationState {
  final String errorMessage;

  const SignUpError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


// ######################################################


class LogInInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class LogInLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class LogInLoaded extends RegistrationState {
  final List<RegistrationModel> registrationModel;

  const LogInLoaded({required this.registrationModel});

  @override
  List<Object> get props => [registrationModel];  // تعديل هنا ليكون registrationModel
}


class LogInError extends RegistrationState {
  final String errorMessage;

  const LogInError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
