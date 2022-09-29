import 'package:statrco/core/error/failure.dart';
import 'package:statrco/features/data/datasources/secure_storage.dart';
import 'package:statrco/features/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> signInWithusename(String username, String password);
  //TODO: sign up
  signUp();

  Future<Either<List<Present_user>, Failure>> getUsers();
}
