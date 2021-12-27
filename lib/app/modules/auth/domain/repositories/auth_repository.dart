import 'package:app_triple/app/modules/auth/domain/entities/logges_user_info.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/erros.dart';

import '../entities/created_user.dart';
import '../usecases/created_usecase.dart';

import '../entities/recovered_user.dart';

import '../usecases/logged_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUserInfo>> login(CredentialsParams params);
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params);
  Future<Either<AuthException, CreatedUser>> create(Createparams params);

  Future<Either<ErrorLogout, Unit>> logout();

  Future<Either<AuthException, LoggedUserInfo>> loggedUser();
}
