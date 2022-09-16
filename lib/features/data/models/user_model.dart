import 'dart:convert';

import 'package:statrco/features/domain/entities/user_entities.dart';

class SignUpModel extends sign_up_user  {
  SignUpModel({
    required firstname,
    required lastname,
    required password,
    required phone,
    required status,
    required imageUrl,
    required username,
  }) : super(
          firstname: firstname,
          lastname: lastname,
          password: password,
          username: username,
          phone: phone,
          status: status,
          imageUrl: imageUrl,
        );

  Map toJSON() => {
        'firstname': firstname,
        'lastname': lastname,
        'password': password,
        'username': username,
        'phone': phone,
        'status': status,
        'imageUrl': imageUrl,
      };
}

class SignInNodel extends sign_in_user {
  SignInNodel({
    required password,
    required username,
  }) : super(password: password, username: username);
  String toJSON() => jsonEncode({
        "username": username,
        "password": password
      });
}

class PresentUserModel extends present_user {
  PresentUserModel({
    required firstname,
    required lastname,
    required phone,
    required status,
    required imageUrl,
    required username,
  }) : super(
            firstname: firstname,
            lastname: lastname,
            phone: phone,
            status: status,
            imageUrl: imageUrl,
            username: username);
            
  factory PresentUserModel.fromJson(Map<String, dynamic> json) {
    return PresentUserModel(
        firstname: json['firstname'],
        lastname: json['lastname'],
        phone: json['phone'],
        status: json['status'],
        imageUrl: json['imageUrl'],
        username: json['username']);
  }
}
