import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:statrco/features/data/datasources/secure_storage.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import 'package:statrco/features/domain/usecases/auth.dart';
import 'package:statrco/features/presentation/cubit/auth/auth_state.dart';
import 'package:statrco/features/presentation/pages/load_page.dart';

class authCubit extends Cubit<authState> {
  final SignInWithEmail signInWithEmail;
  String? username;
  String? password;

  authCubit(this.signInWithEmail) : super(loadingState());

  void setSignUp() {
    emit(SignUpState());
  }

  void setSignIn() {
    emit(SignInState());
  }

  void signIn(String username, String password) async {
    emit(loadingState());
    final result = await signInWithEmail.execute(username, password);
    result.fold((failure) => emit(error_state(failure.message)),
        (r) => emit(LoginCompletedState(r)));
  }

  void chekJWT() async {
    //TODO: поправить "ЭТО"
    jwtTocken? jwt;
    String? token = await jwt?.getTocken();
    emit(loadingState());
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (token == null) {
        emit(SignInState());
        return;
      } else {
        emit(LoginCompletedState(token));
      }
    });
  }

  void onAppSt() {}
}
