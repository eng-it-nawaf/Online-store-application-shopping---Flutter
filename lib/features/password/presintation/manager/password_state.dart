import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  final bool isPasswordValid;
  final bool showError;
  final String currentPassword;

  const PasswordState({
    this.isPasswordValid = false,
    this.showError = false,
    this.currentPassword = '',
  });

  PasswordState copyWith({
    bool? isPasswordValid,
    bool? showError,
    String? currentPassword,
  }) {
    return PasswordState(
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      showError: showError ?? this.showError,
      currentPassword: currentPassword ?? this.currentPassword,
    );
  }

  @override
  List<Object?> get props => [isPasswordValid, showError, currentPassword];
}
