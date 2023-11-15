// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/login_controller/login_controller.dart';
import 'widgets/actions_scope_widget.dart';
import 'widgets/credentials_fields_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _loginControllerApp = LoginControllerApp(loginIUsecase: GetIt.I.get());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: 250),
            const SizedBox(height: 40),
            CredentialsFields(loginControllerApp: _loginControllerApp),
            const SizedBox(height: 16),
            ActionsScope(loginControllerApp: _loginControllerApp),
            const SizedBox(height: 40),
            const Text(
              "Política de Privacidade",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
