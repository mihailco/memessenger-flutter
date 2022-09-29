import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class jwtTocken {
  final storage = new FlutterSecureStorage();

  void writeTocken(String token) async {
    await storage.write(key: "jwt", value: token);
  }

  Future<String?> getTocken() async {
    return await storage.read(key: "jwt");
  }
}
