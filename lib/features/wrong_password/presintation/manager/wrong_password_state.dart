import 'package:equatable/equatable.dart';

class WrongPasswordState extends Equatable {
  final int attemptCount;
  final bool isLocked;

  const WrongPasswordState({this.attemptCount = 0, this.isLocked = false});

  WrongPasswordState copyWith({int? attemptCount, bool? isLocked}) {
    return WrongPasswordState(
      attemptCount: attemptCount ?? this.attemptCount,
      isLocked: isLocked ?? this.isLocked,
    );
  }

  @override
  List<Object> get props => [attemptCount, isLocked];
}
