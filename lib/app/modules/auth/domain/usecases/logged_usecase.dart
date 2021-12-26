import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import '../entities/logged_user.dart';
import '../repositories/auth_repository.dart';
import '../errors/erros.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, LoggedUser>> call(CredentialsParams params);
}

class LoggedUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoggedUsecase(this.repository);

  @override
  Future<Either<AuthException, LoggedUser>> call(
      CredentialsParams params) async {
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
