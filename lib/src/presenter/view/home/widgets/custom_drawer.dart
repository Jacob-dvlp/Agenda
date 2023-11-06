// ignore_for_file: use_build_context_synchronously

import 'package:app_processo_seletivo_target/src/data/client/local/shared_preference.dart';
import 'package:flutter/material.dart';

import '../../login/login_page.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 70, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Icon(
                Icons.settings,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Configurações',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                width: 2,
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final value = await remove(key: "token");
                  if (value == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
