import 'package:app_triple/app/modules/auth/domain/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/domain/entities/recovered_user.dart';
import 'package:app_triple/app/modules/auth/domain/errors/erros.dart';
import 'package:app_triple/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_triple/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    if (params.password == '1234') {
      return Left(AuthException('Repository Erro'));
    }

    return Right(LoggedUser(name: "Maydana", email: params.email));
  }

  @override
  Future<Either<AuthException, RecoveredUser>> recovery(
      CredentialsParams params) async {
    return Right(RecoveredUser(email: 'mattmaydana@mail.com'));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);

  String password = '123456789';

  test('Deve efetuar o login', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: password),
    );

    expect(result.isRight(), true);
    expect(result.getOrElse(() => LoggedUser(name: '', email: '')).name,
        "Maydana");
  });

  test('Deve dar erro quando o e-mail for inválido', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana', password: password),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for vazio', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: ''),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for menor que 8 caracter', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: '123'),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for maior que 36 caracter', () async {
    final result = await usecase(
      CredentialsParams(
          email: 'mattmaydana@gmail.com',
          password: '42424242424242424242424242424242424242'),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar repository falhar', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: '1234'),
    );

    expect(result.isLeft(), true);
  });
}
