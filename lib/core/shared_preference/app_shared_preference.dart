import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {

  static const String userLoggedInStatusKey = 'USER_LOGGED_IN_STATUS_KEY';

  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setUserLoggedInStatus(bool status) async {
    _sharedPreferences.setBool(userLoggedInStatusKey, status);
  }

  static bool? getUserLoggedInStatus() {
    return _sharedPreferences.getBool(userLoggedInStatusKey);
  }

}