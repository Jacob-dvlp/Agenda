// ignore_for_file: use_build_context_synchronously

import 'package:app_processo_seletivo_target/src/data/client/local/shared_preference.dart';
import 'package:app_processo_seletivo_target/src/domain/usecases/login_usecase_i.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/login_failure.dart';
import '../../domain/entities/entitie_user_model.dart';

part 'login_controller.g.dart';

class LoginControllerApp = LoginController with _$LoginControllerApp;

abstract class LoginController with Store {
  @observable
  bool isLoading = false;
  EntitieUserModel? entitieUserModel;

  final usernameController = TextEditingController();
  final passWordController = TextEditingController();

  final LoginIUsecase loginIUsecase;

  LoginController({required this.loginIUsecase});

  @action
  Future<EntitieUserModel?> login(BuildContext context) async {
    try {

      checkLogin(true);
      entitieUserModel = await loginIUsecase.login(
          username: usernameController.text, passWord: passWordController.text);
      create(token: entitieUserModel!.token!);   
      checkLogin(false);
      return entitieUserModel!;
    } on LoginException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.httpResponse!.message!)),
      );
      return checkLogin(false);
    }
  }

  @action
  checkLogin(bool value) {
    isLoading = value;
  }
}
