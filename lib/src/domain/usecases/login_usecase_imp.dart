import 'package:app_processo_seletivo_target/helpers/login_failure.dart';

import 'package:app_processo_seletivo_target/src/domain/entities/entitie_user_model.dart';


import '../../data/client/http_exception.dart';
import '../respository/login_repository_l.dart';
import 'login_usecase_i.dart';

class LoginUserUsecaseImp extends LoginIUsecase {
  final RepositoryLoginI repositoryLogin;

  LoginUserUsecaseImp({required this.repositoryLogin});
  @override
  Future<EntitieUserModel> login(
      {required String username, required String passWord}) async {
    try {
      final response =
          await repositoryLogin.login(username: username, passWord: passWord);

      return response;
    } on LoginServerNotFound catch (e) {
      throw HttpExceptionCustom(
        message: e.httpResponse!.message,
      );
    }
  }
}
