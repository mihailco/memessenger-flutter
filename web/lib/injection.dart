
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:statrco/features/data/datasources/auth.dart';
import 'package:statrco/features/data/datasources/websocket.dart';
import 'package:statrco/features/data/repositories/user_repository_imp.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import 'package:statrco/features/domain/usecases/auth.dart';
import 'package:statrco/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init(){
  //bloc
  locator.registerFactory(() => authCubit(locator()));

  //usecase
  locator.registerLazySingleton(() => SignInWithEmail(locator()));

  //repository
  locator.registerLazySingleton<UserRepository>(
    ()=> UserRepositoryImpl(
      locator()
    ),
  );

  //data source
  locator.registerLazySingleton<MyApi>(()=>MyApiImpl(locator()));
    locator.registerLazySingleton<MyWs>(()=>MyWsImpl(locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}