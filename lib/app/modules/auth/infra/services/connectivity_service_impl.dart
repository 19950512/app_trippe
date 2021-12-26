import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/services/connectivity_service.dart';
import 'package:app_triple/app/modules/auth/infra/drivers/connectivity_driver.dart';
import 'package:dartz/dartz.dart';

class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<AuthException, Unit>> isOnline() async {
    try {
      var check = await driver.isOnline;
      if (check) {
        return Right(unit);
      }
      throw ConnectionError(message: "Você está offline");
    } catch (e) {
      return Left(
        AuthException(message: "Erro ao recuperar informação de conexão"),
      );
    }
  }
}
