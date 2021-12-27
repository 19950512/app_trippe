import 'package:dartz/dartz.dart';

import 'package:app_triple/app/services/errors/erros.dart';

import 'connectivity_service_driver.dart';
import 'interfaces/connectivity_service_interface.dart';

class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    var check = await driver.isOnline;

    if (check) {
      return const Right(unit);
    }

    return Left(ConnectionError(message: 'Você está offline.'));
  }
}
