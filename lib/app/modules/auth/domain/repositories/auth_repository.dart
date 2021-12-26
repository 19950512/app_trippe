import 'package:dartz/dartz.dart';

import '../../domain/errors/erros.dart';

import '../entities/created_user.dart';
import '../usecases/created_usecase.dart';

import '../entities/recovered_user.dart';

import '../entities/logged_user.dart';
import '../usecases/logged_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params);
  Future<Either<AuthException, CreatedUser>> create(Createparams params);
}
