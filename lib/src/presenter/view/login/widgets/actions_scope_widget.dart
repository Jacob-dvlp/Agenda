// ignore_for_file: use_build_context_synchronously

import 'package:app_processo_seletivo_target/helpers/rgx.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/shared/elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../controllers/login_controller/login_controller.dart';

class ActionsScope extends StatelessWidget {
  const ActionsScope({
    super.key,
    required LoginControllerApp loginControllerApp,
  }) : _loginControllerApp = loginControllerApp;

  final LoginControllerApp _loginControllerApp;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => _loginControllerApp.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : _buildLoginButton(context),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevationButton(
      onPressed: () async {
        if (_loginControllerApp.usernameController.text.isEmpty ||
            _loginControllerApp.passWordController.text.isEmpty) {
          showErrorSnackMessage(
            context: context,
            message: 'Campos vazios não são permitidos',
          );
          return;
        }
        if (_loginControllerApp.usernameController.text.length <= 4 ||
            _loginControllerApp.passWordController.text.length <= 4) {
          showErrorSnackMessage(
            context: context,
            message: 'Usename ou senha não pode conter menos que 3 letras',
          );
          return;
        } else if (!alphabetRegex
                .hasMatch(_loginControllerApp.usernameController.text) ||
            !alphabetRegex.hasMatch(
              _loginControllerApp.passWordController.text,
            )) {
          showErrorSnackMessage(
            context: context,
            message: 'Caracteres especiais  não são permetidos',
          );
          return;
        } else {
          final data = await _loginControllerApp.login(context);
          if (data!.token!.isNotEmpty) {
            Navigator.pushReplacementNamed(context, "/home");
          }
        }
      },
      child: "Entrar",
    );
  }

  void showErrorSnackMessage({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        content: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
        ),
      ),
    );
  }
}
