import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import '../entities/recovered_user.dart';
import '../errors/erros.dart';
import '../repositories/auth_repository.dart';

import 'logged_usecase.dart';

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
      return Left(AuthException(message: 'Erro email'));
    }

    return await repository.recovery(params);
  }
}
