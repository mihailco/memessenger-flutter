import 'package:dartz/dartz.dart';
import 'package:statrco/core/error/failure.dart';
import 'package:statrco/features/data/datasources/secure_storage.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';

class SignInWithEmail{
  final UserRepository userRepository;

  SignInWithEmail(this.userRepository);
  Future<Either<Failure, String>> execute(String username, String password ){
    return userRepository.signInWithusename(username, password);
  }
}