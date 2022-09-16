
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:statrco/features/data/datasources/api.dart';
import 'package:statrco/features/data/repositories/user_repository_imp.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import 'package:statrco/features/domain/usecases/auth.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_cubit.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init(){
  //bloc
  locator.registerFactory(() => startedCubit(locator()));

  //usecase
  locator.registerLazySingleton(() => signInWithEmail(locator()));

  //repository
  locator.registerLazySingleton<UserRepository>(
    ()=> userRepositoryImpl(
      locator()
    ),
  );

  //data source
  locator.registerLazySingleton<MyApi>(()=>MyApiImpl(locator()));


  //external
  locator.registerLazySingleton(() => http.Client());
}