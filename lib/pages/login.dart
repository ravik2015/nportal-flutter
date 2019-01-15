import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './../utils/auth_utils.dart';
import './../utils/network_utils.dart';
import './../widgets/RaisedGradientButton.dart';
import './../validators/email_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController1 = TextEditingController();

  String _errorText, _emailError, _passwordError;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    print(authToken);
    if (authToken != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  _authenticateUser() async {
    _showLoading();
    print(_valid());
    if (_valid()) {
      var responseJson = await NetworkUtils.authenticateUser(
          _emailController.text, _passwordController.text);
      if (responseJson["status"] == 0) {
        NetworkUtils.showSnackBar(
            _scaffoldKey, responseJson["error"][0]["message"]);
      } else if (responseJson == null) {
        NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
      } else if (responseJson == 'NetworkError') {
        NetworkUtils.showSnackBar(_scaffoldKey, null);
      } else if (responseJson['errors'] != null) {
        NetworkUtils.showSnackBar(_scaffoldKey, 'Invalid Email/Password');
      } else {
        AuthUtils.insertDetails(_sharedPreferences, responseJson);
        /**
				 * Removes stack and start with the new page.
				 * In this case on press back on HomePage app will exit.
				 * **/
        Navigator.pushReplacementNamed(context, '/home');
      }
      _hideLoading();
    } else {
      setState(() {
        _isLoading = false;
        _emailError;
        _passwordError;
      });
    }
  }

  _valid() {
    bool valid = true;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    } else if (!_emailController.text.contains(EmailValidator.regex)) {
      valid = false;
      _emailError = "Enter valid email!";
    } else {
      _emailError = null;
    }

    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password can't be blank!";
    } else if (_passwordController.text.length < 6) {
      valid = false;
      _passwordError = "Password is invalid!";
    } else {
      _passwordError = null;
    }

    return valid;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                SizedBox(height: 16.0),
                Text(
                  'ACT Home1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffb2D3F9E),
                      fontSize: 20),
                ),
                Text(
                  'Health Services, Inc',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffb2D3F9E),
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 90.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: const Color(0xffb2D3F9E), width: 1.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(
                      color: const Color(0xffb2D3F9E), width: 0.0),
                ),
                border: const UnderlineInputBorder(),
                icon: const Icon(
                  Icons.person,
                  color: const Color(0xffb2D3F9E),
                ),
                labelText: 'Username',
                labelStyle: new TextStyle(color: const Color(0xffb2D3F9E)),
                errorText: this._emailError,
              ),
            ),
            // spacer
            SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: const BorderSide(
                      color: const Color(0xffb2D3F9E), width: 1.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(
                      color: const Color(0xffb2D3F9E), width: 0.0),
                ),
                border: const UnderlineInputBorder(),
                icon: const Icon(
                  Icons.lock,
                  color: const Color(0xffb2D3F9E),
                ),
                labelText: 'Password',
                labelStyle: new TextStyle(color: const Color(0xffb2D3F9E)),
                errorText: this._passwordError,
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            new Container(
              width: screenSize.width,
              child: RaisedGradientButton(
                  child: this._isLoading
                      ? new CircularProgressIndicator(
                          value: null,
                          // strokeWidth: 1.0,
                        )
                      : new Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      const Color(0xffb2D3E9D),
                      const Color(0xffb3098CF),
                    ],
                  ),
                  borderRadius: new BorderRadius.circular(30.0),
                  onPressed: () {
                    if (!this._isLoading) {
                      this._authenticateUser();
                    }
                  }),
              margin: new EdgeInsets.only(top: 40.0, left: 20, right: 20),
            )
          ],
        ),
      ),
    );
  }
}
