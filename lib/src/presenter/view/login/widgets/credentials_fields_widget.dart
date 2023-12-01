import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../controllers/login_controller/login_controller.dart';

class CredentialsFields extends StatelessWidget {
  const CredentialsFields({
    super.key,
    required LoginControllerApp loginControllerApp,
  }) : _loginControllerApp = loginControllerApp;

  final LoginControllerApp _loginControllerApp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            controller: _loginControllerApp.usernameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: const Text("Digite seu username"),
              prefixIcon: const Icon(Icons.person_2_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (context) => TextFormField(
              controller: _loginControllerApp.passWordController,
              obscureText: _loginControllerApp.showPasswhord,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Digite sua senha"),
                suffixIcon: _loginControllerApp.showPasswhord
                    ? IconButton(
                        onPressed: () {
                          _loginControllerApp.showPasswhordText(false);
                        },
                        icon: const Icon(Icons.visibility_off_outlined),
                      )
                    : IconButton(
                        onPressed: () {
                          _loginControllerApp.showPasswhordText(true);
                        },
                        icon: const Icon(Icons.visibility_outlined),
                      ),
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
