import 'package:app_processo_seletivo_target/src/data/client/local/shared_preference.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/home/home_page.dart';
import 'package:app_processo_seletivo_target/src/presenter/view/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String token = "";
  getToken() async {
    token = await read(key: "token");
  }

  @override
  void initState() {
    getToken();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token.isEmpty) {
          return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        } else if (token.isNotEmpty) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200,
            )
          ],
        ),
      ),
    );
  }
}
