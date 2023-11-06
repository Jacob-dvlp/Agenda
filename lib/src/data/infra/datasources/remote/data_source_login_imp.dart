import 'dart:convert';
import 'dart:developer';

import '../../../../domain/datasource/remote/login_datasource_i.dart';
import '../../../client/i_http.dart';
import '../../models/login_model.dart';

class DataSourceLoginImp extends LoginDatasourceI {
  final IHttp iHttp;

  DataSourceLoginImp({required this.iHttp});

  @override
  Future<LoginModel> login(
      {required String username, required String passWord}) async {
    LoginModel? loginModel;

    final response = await iHttp.post(
      "auth/login",
      data: json.encode({"username": username, "password": passWord}),
    );
    if (response.statusCode == 200) {
      loginModel = LoginModel.fromMap(response.data);
    } else {
      log(response.data());
    }
    return loginModel!;
  }
}
