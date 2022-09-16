import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:statrco/features/domain/entities/secure_storage.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_state.dart';
import 'package:statrco/features/presentation/pages/loadPage.dart';

class startedCubit extends Cubit<startedState> {
  final UserRepository rep;
  startedCubit(this.rep) : super(loading_state());

  void chekJWT() async {
    jwtTocken? jwt;
    String? token = await jwt?.getTocken();
    emit(loading_state());
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (token == null) {
        emit(authInState());
        return;
      } else {
          emit(loginCompleted(token));
      }
    });
  }
  
  void onAppSt(){

  }
}
