import 'package:app_triple/app/modules/auth/domain/usecases/logged_usecase.dart';
import 'package:app_triple/app/modules/auth/infra/models/login_model.dart';

abstract class LoginDatasource {
  Future<LoginUserModel> login(CredentialsParams params);
}
