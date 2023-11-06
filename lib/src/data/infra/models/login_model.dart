import 'dart:convert';

import '../../../domain/entities/entitie_user_model.dart';

class LoginModel extends EntitieUserModel {
  final int iduser;
  final String usernameuser;
  final String emailuser;
  final String firstNameuser;
  final String lastNameuser;
  final String genderuser;
  final String imageuser;
  final String tokenuser;

  const LoginModel(
      {required this.iduser,
      required this.usernameuser,
      required this.emailuser,
      required this.firstNameuser,
      required this.lastNameuser,
      required this.genderuser,
      required this.imageuser,
      required this.tokenuser})
      : super(
            id: iduser,
            username: usernameuser,
            email: emailuser,
            firstName: firstNameuser,
            lastName: lastNameuser,
            gender: genderuser,
            image: imageuser,
            token: tokenuser);

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        iduser: json["id"],
        usernameuser: json["username"],
        emailuser: json["email"],
        firstNameuser: json["firstName"],
        lastNameuser: json["lastName"],
        genderuser: json["gender"],
        imageuser: json["image"],
        tokenuser: json["token"],
      );
}
LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));
