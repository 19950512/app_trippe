import 'package:dartz/dartz.dart';

import '../../auth/errors/erros.dart';
import '../entities/logged_user.dart';
import '../usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthException, LoggedUser>> login(CredentialsParams params);
}
