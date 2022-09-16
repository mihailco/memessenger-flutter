import 'package:flutter/cupertino.dart';

class present_user {
  final String firstname;
  final String lastname;
  final String phone;
  final String status;
  final String imageUrl;
  final String username;

  present_user({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.status,
    required this.imageUrl,
    required this.username,
  });
}

class sign_up_user {
  late String firstname;
  late String lastname;
  late String password;
  late String phone;
  late String status;
  late String imageUrl;
  late String username;

    sign_up_user({
    required this.firstname,
    required this.password,
    required this.username,
    this.lastname = "",
    this.phone = "",
    this.status = "",
    this.imageUrl = "",
  });
}

class sign_in_user {
  late String password;
  late String username;
  
  sign_in_user({
    required this.password,
    required this.username,
  });
}
