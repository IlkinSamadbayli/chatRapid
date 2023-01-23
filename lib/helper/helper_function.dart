import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String namedKey = 'NAMEDKEY';
  static String userEmailKey = 'USEREMAILKEY';

  static Future<bool?> saveUserLoggedInStatus(bool isLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setBool(userLoggedInKey, isLoggedIn);
  }

  static Future<bool?> saveUserName(String userName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(namedKey, userName);
  }

  static Future<bool?> saveUserEmail(String userEmail) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userEmailKey, userEmail);
  }

  static Future<bool?> get getUserLoggedInStatus async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
}
