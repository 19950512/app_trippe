import 'package:app_triple/app/modules/auth/entities/logged_user.dart';
import 'package:app_triple/app/modules/auth/errors/erros.dart';
import 'package:app_triple/app/modules/auth/repositories/auth_repository.dart';
import 'package:app_triple/app/modules/auth/usecases/login_usecase.dart';
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
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);

  test('Deve efetuar o login', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: '123'),
    );

    expect(result.isRight(), true);
    expect(result.fold(id, id), "Maydana");
  });

  test('Deve dar erro quando o e-mail for inválido', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana', password: '123'),
    );

    expect(result.isLeft(), true);
  });

  test('Deve dar erro quando o password for vazio', () async {
    final result = await usecase(
      CredentialsParams(email: 'mattmaydana@gmail.com', password: ''),
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
