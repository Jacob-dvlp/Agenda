import 'package:app_processo_seletivo_target/src/dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';


void main()  {
  Dependencies().inject();
  runApp(const AppWidget());
}
