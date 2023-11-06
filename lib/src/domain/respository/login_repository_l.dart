import 'package:dartz/dartz.dart';

import '../entities/entitie_user_model.dart';

abstract  class RepositoryLoginI {
  Future<EntitieUserModel> login(
      {required String username, required String passWord});
}
