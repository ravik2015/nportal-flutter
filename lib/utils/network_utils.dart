import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
  static final String host = serverurl;
  static final String productionHost = 'https://authflow.herokuapp.com';
  static final String developmentHost = 'http://192.168.31.110:3000';
  static final String serverurl = "https://api.acthomehealthservices.us";

  static dynamic authenticateUser(String email, String password) async {
    var uri = host + AuthUtils.endPoint;

    try {
      final response = await http.post(uri,
          body: json.encode({'username': email, 'password': password}));

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static logoutUser(BuildContext context, SharedPreferences prefs) async {
    prefs.remove(AuthUtils.authTokenKey);
    prefs.remove(AuthUtils.userData);
    Navigator.of(context).pushReplacementNamed('/');
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    print(scaffoldKey);
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static fetch(var authToken, var endPoint) async {
    var uri = host + endPoint;
    print(authToken);
    print(uri);
    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
