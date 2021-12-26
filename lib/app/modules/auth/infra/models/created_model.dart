import 'dart:convert';

import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';

class CreatedModel extends CreatedUser {
  final String name;
  final String email;

  CreatedModel({required this.email, required this.name})
      : super(name: name, email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory CreatedModel.fromMap(Map<String, dynamic> map) {
    return CreatedModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatedModel.fromJson(String source) =>
      CreatedModel.fromMap(json.decode(source));
}
