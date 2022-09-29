import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:statrco/features/data/datasources/auth.dart';

void main() {
  /// To test the registration, change below
  const username = "mihailco33";
  String phone = "8912";
  String email = "asd";

  const password = "qwerty125";
  String firstname = "qwe";
  String lastname = "qwe";
  String imageUrl = "";
  String status = "Тест";
  late http.Client client;
  late MyApiImpl dataSource;
  setUp(() {
    client = http.Client();
    dataSource = MyApiImpl(client);
  });
  test("sign up", () async{
    final result = await dataSource.signUp(username, password, firstname, lastname, imageUrl, status);
  });

  test("authorization with name Should return the string", () async {
    final result = await dataSource.signInWithUsername(password, username);
  });

}
