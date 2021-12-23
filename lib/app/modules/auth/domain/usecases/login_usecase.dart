import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import '../errors/erros.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, LoggedUser>> call(CredentialsParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<AuthException, LoggedUser>> call(
      CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException('Erro email'));
    }
    if (params.password.isEmpty) {
      return Left(AuthException('Erro password'));
    }

    return await repository.login(params);
  }
}

class CredentialsParams {
  final String email;
  final String password;

  CredentialsParams({required this.email, required this.password});
}
