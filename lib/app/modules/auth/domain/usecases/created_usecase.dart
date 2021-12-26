import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import '../entities/created_user.dart';
import '../repositories/auth_repository.dart';
import '../errors/erros.dart';

abstract class ICreateUsecase {
  Future<Either<AuthException, CreatedUser>> call(Createparams params);
}

class CreateUsecase implements ICreateUsecase {
  final AuthRepository repository;

  CreateUsecase(this.repository);

  @override
  Future<Either<AuthException, CreatedUser>> call(Createparams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException(message: 'Informe um e-mail válido'));
    }
    if (params.password.isEmpty) {
      return Left(AuthException(message: 'Password vazio'));
    }
    if (params.name.isEmpty) {
      return Left(AuthException(message: 'Nome vazio'));
    }

    if (params.password.length < 8) {
      return Left(AuthException(
          message: 'A senha precisa conter no mínimo 8 caracter'));
    }
    if (params.password.length > 36) {
      return Left(AuthException(
          message: 'A senha precisa conter no máximo 36 caracter'));
    }

    return await repository.create(params);
  }
}

class Createparams {
  final String name;
  final String email;
  final String password;

  Createparams(
      {required this.name, required this.email, required this.password});
}
