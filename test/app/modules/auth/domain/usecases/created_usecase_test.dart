import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/created_user.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/created_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, CreatedUser>> create(Createparams params) async {
    if (params.name == 'falha ai') {
      return Left(AuthException(message: 'Erro no Repository'));
    }
    return Right(CreatedUser(email: 'mattmaydana@gmail.com', name: 'Maydana'));
  }

  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    return Right(LoggedUser(email: 'mattmaydana@gmail.com', name: 'Maydana'));
  }

  @override
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params) async {
    return Right(RecoveredUser(email: 'mattmaydana@gmail.com'));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = CreateUsecase(repository);

  String password = '123456789';
  String name = 'Maydana';
  String email = 'mattmaydana@gmail.com';

  test('Deve criar uma conta', () async {
    final result = await usecase(
      Createparams(
        name: name,
        email: email,
        password: password,
      ),
    );

    expect(result.isRight(), true);
    expect(result.getOrElse(() => CreatedUser(name: name, email: email)).name,
        name);
  });

  test('Deve dar erro quando o e-mail for inválido', () async {
    final result = await usecase(
      Createparams(
        name: name,
        email: '',
        password: password,
      ),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for inválido', () async {
    final result = await usecase(
      Createparams(
        name: name,
        email: email,
        password: '',
      ),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o nome for inválido', () async {
    final result = await usecase(
      Createparams(
        name: '',
        email: email,
        password: password,
      ),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for menor que 8 caracter', () async {
    final result = await usecase(
      Createparams(
        name: name,
        email: email,
        password: '123',
      ),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for maior que 36 caracter', () async {
    final result = await usecase(
      Createparams(
        name: name,
        email: email,
        password: '42424242424242424242424242424242424242',
      ),
    );

    expect(result.isLeft(), true);
  });

  test('Deve falhar o repository', () async {
    final result = await usecase(
      Createparams(
        name: 'falha ai',
        email: email,
        password: password,
      ),
    );

    expect(result.isLeft(), true);
  });
}
