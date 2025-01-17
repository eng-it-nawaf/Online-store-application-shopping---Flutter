class PasswordAttemptModel {
  final int attemptCount;

  PasswordAttemptModel({required this.attemptCount});

  PasswordAttemptModel copyWith({int? attemptCount}) {
    return PasswordAttemptModel(
      attemptCount: attemptCount ?? this.attemptCount,
    );
  }
}
