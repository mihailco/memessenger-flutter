import 'package:statrco/features/data/constants.dart';
import 'package:statrco/features/data/exception.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart'; // as http;

abstract class MyApi {
  // getUsers();
  Future<String> signInWithUsername(String password, String username);
  int signUp();
  // sendMessage();
  // getMessages();
}

class MyApiImpl implements MyApi {
  final http.Client client;
  MyApiImpl(this.client);

  @override
  Future<String> signInWithUsername(String password, String username) async {
    final resp = await client.post(Uri.parse(Urls.signIn),
    headers: {'Content-type' : 'application/json'},
        body: SignInNodel(password: password, username: username).toJSON()
        );
    if (resp.statusCode == 200) {
      return resp.body;
    } else {
      print(resp.statusCode);
      throw ServerException();
    }
  }

  @override
  int signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
