// ignore_for_file: use_build_context_synchronously

import 'package:app_processo_seletivo_target/helpers/rgx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/login_controller/login_controller.dart';
import '../shared/elevation_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _loginControllerApp = LoginControllerApp(loginIUsecase: GetIt.I.get());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
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
                  const SizedBox(
                    height: 40,
                  ),
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
            ),
            const SizedBox(
              height: 40,
            ),
            Observer(
              builder: (context) => !_loginControllerApp.isLoading
                  ? ElevationButton(
                      onPressed: () async {
                        if (_loginControllerApp
                                .usernameController.text.isEmpty ||
                            _loginControllerApp
                                .passWordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content:
                                    Text("Campos vazios não são permetidos")),
                          );
                          return;
                        }
                        if (_loginControllerApp
                                    .usernameController.text.length <=
                                4 ||
                            _loginControllerApp
                                    .passWordController.text.length <=
                                4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    "Usename ou senha não pode conter menos que 3 letras")),
                          );
                          return;
                        } else if (!alphabetRegex.hasMatch(
                                _loginControllerApp.usernameController.text) ||
                            !alphabetRegex.hasMatch(
                                _loginControllerApp.passWordController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  "Caracteres especiais  não são permetidos"),
                            ),
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
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
            const SizedBox(
              height: 40,
            ),
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
