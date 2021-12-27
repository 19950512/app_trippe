import 'package:app_triple/app/services/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
