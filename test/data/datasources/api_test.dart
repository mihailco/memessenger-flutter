
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:statrco/features/data/datasources/api.dart';

void main() {
  const username = "mihailco3";
  const password = "qwerty125";
  late http.Client client;
  late MyApiImpl dataSource;
  setUp(() {
    client = http.Client();
    dataSource = MyApiImpl(client);
  });
  test("авторизация с именем. Должен вернуть строку", ()async {
      final result = await dataSource.signInWithUsername(password, username);
      print(result);
      expect(result, 12);
  });
}
