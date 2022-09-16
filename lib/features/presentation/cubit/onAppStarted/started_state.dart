// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';

abstract class startedState extends Equatable {
  const startedState();
  @override
  List<Object?> get props => [];
}


class authInState extends startedState {}
class authUpState extends startedState {}
class loading_state extends startedState {}


class error_state extends startedState {
  final String message;

  error_state(this.message);
  @override
  List<Object?> get props => [message];
}

class loginCompleted extends startedState {
  final String token;

  const loginCompleted(this.token);

  @override
  List<Object?> get props => [token];

}