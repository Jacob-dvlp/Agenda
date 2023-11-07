import 'dart:convert';

import '../../../domain/entities/entitie_user_model.dart';

class LoginModel extends EntitieUserModel {

  final String tokenuser;

  const LoginModel(
      {
      required this.tokenuser})
      : super(
           
            token: tokenuser);

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    
        tokenuser: json["token"],
      );
}
LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));
