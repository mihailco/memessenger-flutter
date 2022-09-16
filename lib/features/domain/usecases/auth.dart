import 'package:dartz/dartz.dart';
import 'package:statrco/core/error/failure.dart';
import 'package:statrco/features/domain/entities/secure_storage.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';

class signInWithEmail{
  final UserRepository userRepository;

  signInWithEmail(this.userRepository);
  Future<Either<Failure, String>> call(){
    return userRepository.signInWithEmailRep();
  }
}