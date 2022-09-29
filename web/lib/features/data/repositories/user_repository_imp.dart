import 'package:dartz/dartz.dart';
import 'package:statrco/features/data/datasources/auth.dart';
import 'package:statrco/features/data/exception.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/user_entities.dart';

class UserRepositoryImpl implements UserRepository {
  final MyApi api;

  UserRepositoryImpl(this.api);

  @override
  getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  sendMessage() {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signInWithusename(
      String username, String password) async {
    try {
      final result = await api.signInWithUsername(password, username);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure("invalid status code"));
    }
  }

  @override
  signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<List<Present_user>, Failure>> getUsers() {
    throw UnimplementedError();
  }
}
