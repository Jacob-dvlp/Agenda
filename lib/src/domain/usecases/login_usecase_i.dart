
import '../entities/entitie_user_model.dart';

abstract 
 class LoginIUsecase {
  Future<EntitieUserModel> login(
      {required String username, required String passWord});
}
