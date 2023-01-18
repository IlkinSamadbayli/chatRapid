import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String namedKey = 'NAMEDKEY';
  static String userEmailKey = 'USEREMAILKEY';

  static Future<bool?> get getUserLoggedInStatus async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(userLoggedInKey);
  }
}
