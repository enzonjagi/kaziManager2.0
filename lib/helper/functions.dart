

import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String UserLoggedinKey = "USERLOGGEDINKEY";

  static saveUserLoggedInDetails({bool isLoggedIn}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(UserLoggedinKey, isLoggedIn);
  }

  static Future<bool> getuserLoggedInDetails({bool isLoggedIn}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(UserLoggedinKey);
  }
}