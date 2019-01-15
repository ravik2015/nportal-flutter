import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../utils/auth_utils.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _logout() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(AuthUtils.authTokenKey);
      prefs.remove(AuthUtils.userData);
      Navigator.of(context).pushReplacementNamed('/');
    }

    _onTapOtherAccounts(BuildContext context) {}

    void _underDevelopment() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Under development"),
            content: new Text(""),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _onLogoutTap() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Are you share you want to logout?"),
            content: new Text(""),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  _logout();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
        child: new Drawer(
            child: Container(
                // Add box decoration
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.4, 0.5, 0.6],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.indigo[300],
                      Colors.indigo[400],
                      Colors.indigo[500],
                      Colors.indigo[600],
                    ],
                  ),
                ),
                child: new ListView(
                    padding: const EdgeInsets.only(top: 0.0),
                    children: <Widget>[
                      new UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            // Box decoration takes a gradient
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.1, 0.5, 0.7, 0.9],
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Colors.indigo[300],
                                Colors.indigo[400],
                                Colors.indigo[500],
                                Colors.indigo[600],
                              ],
                            ),
                          ),
                          accountName: const Text(_AccountName),
                          accountEmail: const Text(_AccountEmail),
                          currentAccountPicture: new CircleAvatar(
                              backgroundColor: Colors.brown,
                              child: new Text(_AccountAbbr)),
                          otherAccountsPictures: <Widget>[
                            new GestureDetector(
                              onTap: () => _onTapOtherAccounts(context),
                              child: new Semantics(
                                label: 'Switch Account',
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ]),
                      new ListTile(
                        title: new Text(
                          'My Schedule',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/home'),
                      ),
                      new ListTile(
                        title: new Text(
                          'Open Shift',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/openShifts'),
                      ),
                      new ListTile(
                        title: new Text(
                          'Potential Cases',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/potentialShifts'),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text(
                          'Printable Forms',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => _underDevelopment(),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text(
                          'Resources',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => _underDevelopment(),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text(
                          'Message Center',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => _underDevelopment(),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new Text(
                          'Logout',
                          style:
                              new TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () => _onLogoutTap(),
                      ),
                    ]))));
  }
}
