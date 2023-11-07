import 'package:shared_preferences/shared_preferences.dart';

Future<bool> create({required String token}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return await sharedPreferences.setString("token", token);
}

Future<String> read({required String? key}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(key!)??"";
}

Future<bool> remove({required String key}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.remove(key);
}
