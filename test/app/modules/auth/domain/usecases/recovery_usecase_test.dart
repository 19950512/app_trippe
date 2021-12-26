import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';
import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/created_usecase.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/recovery_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
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
    if (params.email == 'email@test.com') {
      return Left(AuthException(message: 'Erro no repository'));
    }

    return Right(
      RecoveredUser(email: 'mattmaydana@gmail.com'),
    );
  }

  @override
  Future<Either<AuthException, CreatedUser>> create(Createparams params) async {
    return Right(CreatedUser(email: 'mattmaydana@gmail.com', name: 'Maydana'));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = RecoveryUsercase(repository);

  test('Deve efetuar a recuperação do auth', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com'),
    );

    expect(result.isRight(), true);
    expect(result.getOrElse(() => RecoveredUser(email: '')).email,
        'mattmaydana@gmail.com');
  });

  test('Deve dar erro quando o e-mail for inválido', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana'),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o e-mail for vazio', () async {
    final result = await usecase(
      CredentialsParams(email: ''),
    );

    expect(result.isLeft(), true);
  });

  test('Deve falhar o repository', () async {
    final result = await usecase(
      CredentialsParams(email: 'email@test.com'),
    );

    expect(result.isLeft(), true);
  });
}
