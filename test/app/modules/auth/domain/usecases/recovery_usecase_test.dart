import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    return Right(
      LoggedUser(email: 'mattmaydana@gmail.com', name: 'Maydana'),
    );
  }

  @override
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params) async {
    return Right(
      RecoveredUser(email: 'mattmaydana@gmail.com'),
    );
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = RecoveredUser();

  test('Deve efetuar a recovery', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: password),
    );

    expect(result.isRight(), true);
    expect(result.getOrElse(() => LoggedUser(name: '', email: '')).name,
        "Maydana");
  });
}
