import 'dart:convert';

import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/recovery_usecase.dart';

class RecoveryModel extends RecoveredUser {
  final String email;
  RecoveryModel(
    this.email,
  ) : super(email: email);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory RecoveryModel.fromMap(Map<String, dynamic> map) {
    return RecoveryModel(
      map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecoveryModel.fromJson(String source) =>
      RecoveryModel.fromMap(json.decode(source));
}
