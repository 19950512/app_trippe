import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

import 'package:app_triple/app/modules/auth/domain/entities/logges_user_info.dart';

import '../errors/erros.dart';
import '../repositories/auth_repository.dart';

abstract class ILoginUsecase {
  Future<Either<Failure, LoggedUserInfo>> call(CredentialsParams params);
}

class LoggedUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoggedUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoggedUserInfo>> call(CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException(message: 'Informe um e-mail válido'));
    }
    if (params.password == null && params.password!.isEmpty) {
      return Left(AuthException(message: 'Password vazio'));
    }

    if (params.password!.length < 8) {
      return Left(AuthException(
          message: 'A senha precisa conter no mínimo 8 caracter'));
    }
    if (params.password!.length > 36) {
      return Left(AuthException(
          message: 'A senha precisa conter no máximo 36 caracter'));
    }

    return await repository.login(params);
  }
}

class CredentialsParams {
  final String email;
  final String? password;

  CredentialsParams({required this.email, this.password});
}
