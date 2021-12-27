import 'package:app_triple/app/modules/auth/domain/entities/logges_user_info.dart';
import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLoggedUser {
  Future<Either<AuthException, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final AuthRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<AuthException, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
