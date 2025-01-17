import 'package:equatable/equatable.dart';

class StartState extends Equatable {
  final bool isNavigatingToLogin;
  final bool isNavigatingToCreateAccount;

  const StartState({
    this.isNavigatingToLogin = false,
    this.isNavigatingToCreateAccount = false,
  });

  @override
  List<Object?> get props => [isNavigatingToLogin, isNavigatingToCreateAccount];

  StartState copyWith({
    bool? isNavigatingToLogin,
    bool? isNavigatingToCreateAccount,
  }) {
    return StartState(
      isNavigatingToLogin: isNavigatingToLogin ?? this.isNavigatingToLogin,
      isNavigatingToCreateAccount: isNavigatingToCreateAccount ?? this.isNavigatingToCreateAccount,
    );
  }
}
