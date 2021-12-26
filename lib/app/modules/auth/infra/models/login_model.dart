import 'dart:convert';

import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';

class LoginUserModel extends LoggedUser {
  @override
  final String name;
  @override
  final String email;

  LoginUserModel({required this.name, required this.email})
      : super(name: name, email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserModel.fromJson(String source) =>
      LoginUserModel.fromMap(json.decode(source));
}
