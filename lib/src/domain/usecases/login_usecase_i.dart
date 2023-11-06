import 'package:dartz/dartz.dart';

import '../../../helpers/login_failure.dart';
import '../entities/entitie_user_model.dart';

abstract 
 class LoginIUsecase {
  Future<EntitieUserModel> login(
      {required String username, required String passWord});
}
