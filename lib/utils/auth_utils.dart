import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthUtils {
  // static final String endPoint = '/api/v1/auth_user';
  static final String endPoint = '/users/login';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'auth_token';
  static final String userData = 'userData';
  static final String nameKey = 'name';
  static final String roleKey = 'role';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static insertDetails(SharedPreferences prefs, var response) {
    print(response);
    var user = response["result"];
    prefs.setString(authTokenKey, user['token']);
    prefs.setString(userData, json.encode(user));
  }
}
