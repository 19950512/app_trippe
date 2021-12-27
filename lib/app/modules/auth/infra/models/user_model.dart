import 'dart:convert';

import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logges_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  @override
  String? name;
  @override
  String? email;
  @override
  String? phoneNumber;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
  });

  LoggedUser toLoggedUser() => this;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(name: $name, email: $email, phoneNumber: $phoneNumber)';
}
