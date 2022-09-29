import 'dart:convert';

import 'package:statrco/features/data/constants.dart';
import 'package:statrco/features/data/exception.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart'; // as http;

class _Token {
  String fromJson(Map<String, dynamic> json) {
    return json['token'];
  }
}

abstract class MyApi {
  // getUsers();
  Future<String> signInWithUsername(String password, String username);
  Future<String> signUp(String username, String password, String firstname, String? lastname, String? imageUrl, String? status);
  // sendMessage();
  // getMessages();
}

class MyApiImpl implements MyApi {
  final http.Client client;
  MyApiImpl(this.client);

  @override
  Future<String> signInWithUsername(String password, String username) async {
    final resp = await client.post(Uri.parse(Urls.signIn),
        headers: {'Content-type': 'application/json'},
        body: SignInModel(password: password, username: username).toJSON());
    if (resp.statusCode == 200) {
      return _Token().fromJson(jsonDecode(resp.body));
    } else {
      throw ServerException(resp.statusCode);
    }
  }

  @override
  Future<String> signUp(String username, String password, String firstname, String? lastname, String? imageUrl, String? status) async{
    final resp = await client.post(Uri.parse(Urls.signUp),
        headers: {'Content-type': 'application/json'},
        body: SignUpModel(firstname: firstname, lastname: lastname, password: password, phone: "", status: status, imageUrl: imageUrl, username: username).toJSON());
    if (resp.statusCode == 200) {
      return _Token().fromJson(jsonDecode(resp.body));
    } else {
      throw ServerException(resp.statusCode);
    }
  }
}
