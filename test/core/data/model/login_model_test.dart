import 'dart:convert';

import 'package:app_processo_seletivo_target/src/data/infra/models/login_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/reader_json.dart';

void main() {
  var model = const LoginModel(
    iduser: 17,
    usernameuser: "vcholdcroftg",
    emailuser: "vcholdcroftg@ucoz.com",
    firstNameuser: "Bradford",
    lastNameuser: "Prohaska",
    genderuser: "male",
    imageuser: "https://robohash.org/accusantiumvoluptateseos.png",
    tokenuser:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsInVzZXJuYW1lIjoidmNob2xkY3JvZnRnIiwiZW1haWwiOiJ2Y2hvbGRjcm9mdGdAdWNvei5jb20iLCJmaXJzdE5hbWUiOiJCcmFkZm9yZCIsImxhc3ROYW1lIjoiUHJvaGFza2EiLCJnZW5kZXIiOiJtYWxlIiwiaW1hZ2UiOiJodHRwczovL3JvYm9oYXNoLm9yZy9hY2N1c2FudGl1bXZvbHVwdGF0ZXNlb3MucG5nIiwiaWF0IjoxNjk5MzQyMjI0LCJleHAiOjE2OTkzNDU4MjR9.qY56nnJ5MA03za0XmiupLIHMqEJy2hRPhvQI6lSIliA",
  );
    group('Entity', () {
    test('should be a subclass of Pokemon entity', () async {
      expect(model, isA<LoginModel>());
    });
    
  });

    group('fromJson', () {
    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap = json.decode(fixture('model_json.json'));
      final result = LoginModel.fromMap(jsonMap);
      expect(result, model);
    });
  });

}
