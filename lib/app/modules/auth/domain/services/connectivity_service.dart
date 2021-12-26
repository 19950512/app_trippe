import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectivityService {
  Future<Either<AuthException, Unit>> isOnline();
}
