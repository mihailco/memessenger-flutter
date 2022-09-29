import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:statrco/features/data/models/user_model.dart';

void main() {
  final username = "mihailco3";
  final password = "qwerty3";

  test("проверка toJson у signIn модели", (){
    final result = SignInModel(password: password, username: username).toJSON();
    final expectedJson = jsonEncode({
      "username": username,
      "password": password,
    });
    expect(result, equals(expectedJson));
  });
}