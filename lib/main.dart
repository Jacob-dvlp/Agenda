import 'package:app_processo_seletivo_target/src/data/client/local/shared_preference.dart';
import 'package:app_processo_seletivo_target/src/dependencies/dependencies.dart';
import 'package:app_processo_seletivo_target/src/presenter/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_widget.dart';


void main()  {
  Dependencies().inject();

  Dependencies.getIt<LoginControllerApp>();
  runApp(const AppWidget());
}
