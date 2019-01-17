import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './network_utils.dart';

class ScheduleUtils {
  // static final String endPoint = '/api/v1/auth_user';
  static final String endPoint =
      '/schedules/my?startdate=2018-11-01T14:29:56.400Z&enddate=2018-11-22T14:29:56.400Z';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'auth_token';
  static final String userData = 'userData';
  static final String nameKey = 'name';
  static final String roleKey = 'role';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static fetchSchedules() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson = await NetworkUtils.fetch(getToken(prefs), endPoint);
    print("myschedule for mw====");
    print(responseJson);
    return responseJson;
  }
}
