import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_triple/app/modules/auth/infra/datasources/login_datasources.dart';
import 'package:dartz/dartz.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/created_usecase.dart';

class LoginRepositoryImpl implements AuthRepository {
  final AuthRepository repository;

  LoginRepositoryImpl(this.repository);

  @override
  Future<Either<AuthException, CreatedUser>> create(Createparams params) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    final result = await repository.login(params);
    return result;
  }

  @override
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params) async {
    throw UnimplementedError();
  }
}
