import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/created_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../domain/errors/erros.dart';
import '../entities/logged_user.dart';
import '../usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params);
  Future<Either<AuthException, CreatedUser>> create(Createparams params);
}
