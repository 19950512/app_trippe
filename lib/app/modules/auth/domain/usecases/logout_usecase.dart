import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class Logout {
  Future<Either<ErrorLogout, Unit>> call();
}

class LogoutImpl implements Logout {
  final AuthRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<ErrorLogout, Unit>> call() async {
    return await repository.logout();
  }
}
