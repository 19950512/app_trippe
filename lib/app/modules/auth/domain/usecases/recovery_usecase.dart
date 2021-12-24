import 'dart:io';

import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

import 'login_usecase.dart';

abstract class IRecoveryUsecase {
  Future<Either<AuthException, RecoveredUser>> call(CredentialsParams params);
}

class RecoveryUsercase implements IRecoveryUsecase {
  final AuthRepository repository;

  RecoveryUsercase(this.repository);

  @override
  Future<Either<AuthException, RecoveredUser>> call(
      CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException('Erro email'));
    }

    return await repository.recovery(params);
  }
}
