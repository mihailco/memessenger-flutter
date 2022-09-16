import 'package:statrco/core/error/failure.dart';
import 'package:statrco/features/domain/entities/secure_storage.dart';
import 'package:statrco/features/domain/entities/user_entities.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_state.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> signInWithEmailRep();
  signUp();

  //пока не рализовано в апи
  getMessages();
  sendMessage();
  Future<Either<List<present_user>, Failure>> getUsers();
}
