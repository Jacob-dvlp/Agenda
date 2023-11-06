import 'package:app_processo_seletivo_target/helpers/login_failure.dart';
import 'package:app_processo_seletivo_target/src/domain/datasource/remote/login_datasource_i.dart';

import 'package:app_processo_seletivo_target/src/domain/entities/entitie_user_model.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/respository/login_repository_l.dart';
import '../../client/http_exception.dart';

class LoginRepositoryImp extends RepositoryLoginI {
  final LoginDatasourceI loginDatasourceI;

  LoginRepositoryImp({required this.loginDatasourceI});
  @override
  Future< EntitieUserModel> login(
      {required String username, required String passWord}) async {
    try {
      final response =
          await loginDatasourceI.login(username: username, passWord: passWord);

      return response;
    } on LoginServerNotFound catch (e) {
      throw HttpExceptionCustom(
        message: e.httpResponse!.message,
      );
    }
  }
}
