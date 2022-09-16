
import 'package:dartz/dartz.dart';
import 'package:statrco/features/data/datasources/api.dart';
import 'package:statrco/features/domain/repository/user_repository.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/user_entities.dart';

class userRepositoryImpl implements UserRepository{
    final MyApi api ;

  userRepositoryImpl(this.api);


  
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
  Future<Either<Failure,String>> signInWithEmailRep() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
  @override
  signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  @override
  Future<Either<List<present_user>, Failure> > getUsers(){
    throw UnimplementedError();
  }
}