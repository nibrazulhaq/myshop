// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  String token;

  LoginModel({
    required this.token,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
