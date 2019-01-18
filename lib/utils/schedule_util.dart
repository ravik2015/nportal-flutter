import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './network_utils.dart';

class ScheduleUtils {
  // static final String endPoint = '/api/v1/auth_user';
  // static final String endPoint =
  //     '/schedules?startDate=01/18/2019&endDate=01/25/2019&page=1&limit=15';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'auth_token';
  static final String userData = 'userData';
  static final String nameKey = 'name';
  static final String roleKey = 'role';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static fetchSchedules(from, to) async {
    final String endPoint =
        '/schedules?startDate=${from}&endDate=${to}&page=1&limit=15';

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson = await NetworkUtils.fetch(getToken(prefs), endPoint);
    print("myschedule for mw====");
    print(responseJson);
    return responseJson;
  }
}
