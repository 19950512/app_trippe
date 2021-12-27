import 'package:dartz/dartz.dart';

import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logges_user_info.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/created_usecase.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
import 'package:app_triple/app/modules/auth/infra/datasources/login_datasources.dart';

class LoginRepositoryImpl implements AuthRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<AuthException, CreatedUser>> create(Createparams params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, LoggedUserInfo>> loggedUser() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, LoggedUserInfo>> login(
      CredentialsParams params) async {
    return await datasource.login(params);
  }

  @override
  Future<Either<ErrorLogout, Unit>> logout() async {
    return await datasource.logout();
  }

  @override
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params) async {
    throw UnimplementedError();
    //return await datasource;
  }
}
