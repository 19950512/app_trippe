import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
import 'package:app_triple/app/modules/auth/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginDatasource {
  Future<Either<AuthException, UserModel>> login(CredentialsParams params);
  Future<Either<AuthException, UserModel>> currentUser();
  Future<Either<ErrorLogout, Unit>> logout();
}
