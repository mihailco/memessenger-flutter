// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';

abstract class authState extends Equatable {
  const authState();
  @override
  List<Object?> get props => [];
}


class SignInState extends authState {}
class SignUpState extends authState {}
class loadingState extends authState {}


class error_state extends authState {
  final String message;

  error_state(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginCompletedState extends authState {
  final String token;

  const LoginCompletedState(this.token);

  @override
  List<Object?> get props => [token];

}