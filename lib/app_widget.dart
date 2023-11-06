import 'package:app_processo_seletivo_target/src/presenter/view/add_page/add_page.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/home/home_page.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/login/login_page.dart';
import 'package:flutter/material.dart';

import 'src/presenter/view/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/login": (context) => LoginPage(),
        "/add": (context) => const AddPage(),
        "/home": (context) => const HomePage()
      },
    );
  }
}
