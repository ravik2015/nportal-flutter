import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../utils/auth_utils.dart';
import './../utils/network_utils.dart';

import './../components/DetailsModal.dart';
import './../widgets/CustomDrawer.dart';
import './../models/schedule_model.dart';
import './../widgets/CustomWeekChange.dart';
import './../widgets/BigText.dart';
import './../utils/schedule_util.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeWidget();
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List schedules;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  var _firstDayOfTheweek = new DateTime.now();
  var _lastDayOfTheweek = new DateTime.now().add(new Duration(days: 7));
  BuildContext get context => super.context;

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    var _lastDayOfTheweek = today.add(new Duration(days: 7));
    var from =
        "${new DateTime.now().month}/${new DateTime.now().day}/${new DateTime.now().year}";
    var to =
        "${_lastDayOfTheweek.month}/${_lastDayOfTheweek.day}/${_lastDayOfTheweek.year}";
    schedules = [];
    _loadSchedules(from, to);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DateTime today = DateTime.now();
    _firstDayOfTheweek = today.subtract(new Duration(days: today.weekday));
    _lastDayOfTheweek = _firstDayOfTheweek.add(new Duration(days: 7));
    setState(() {
      _firstDayOfTheweek = _firstDayOfTheweek;
      _lastDayOfTheweek = _lastDayOfTheweek;
    });
  }

  _loadSchedules(from, to) async {
    _showLoading();
    var response = await ScheduleUtils.fetchSchedules(from, to);
    _hideLoading();
    print(response["error"]);
    if ((response["status"] == 0) & (response["error"] == "Token expired")) {
      NetworkUtils.showSnackBar(
          _scaffoldKey, "Token expired, please login again!");
      _logout();
    } else if (response["status"] == 0) {
      NetworkUtils.showSnackBar(_scaffoldKey, response["error"]);
    } else {
      schedules = response["result"]["data"];
    }
    print(schedules);
  }

  _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AuthUtils.authTokenKey);
    prefs.remove(AuthUtils.userData);
    Navigator.of(context).pushReplacementNamed('/');
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

  Future<void> _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new ScheduleDetails();
        })) {
    }
  }

  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ListTile makeListTile(schedule) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            schedule["Scheduler_FirstName"] != null
                ? "${schedule["Scheduler_FirstName"]} ${schedule["Scheduler_LastName"]}"
                : "",
            style: TextStyle(
                color: const Color(0xffb2D3F9E), fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment(-1.0, 0.0),
                  child: Text(
                      schedule["StartTime"] != null
                          ? "${schedule["StartTime"]}-${schedule["EndTime"]}"
                          : "",
                      style: TextStyle(color: const Color(0xffb2D3F9E)))),
              Container(
                  alignment: Alignment(-1.0, 0.0),
                  child: Text(
                      schedule["StatusName"] != null
                          ? schedule["StatusName"]
                          : "",
                      style: TextStyle(color: const Color(0xffb2D3F9E)))),
            ],
          ),
          onTap: () {
            print("details");
            _askedToLead();
          },
        );

    return Scaffold(
        key: _scaffoldKey,
        appBar: new GradientAppBar(
            title: new Text("My Schedule"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: _isLoading
            ? new Center(child: new CircularProgressIndicator())
            : new Column(
                children: <Widget>[
                  new Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment(1.0, 1.0),
                        child: new CustomWeekChange(
                            _firstDayOfTheweek, _lastDayOfTheweek),
                      )),
                  new Expanded(
                      flex: 9,
                      child: schedules.length == 0
                          ? new Center(
                              child: Text(
                              "No schedules found for this date",
                              style: TextStyle(
                                  color: const Color(0xffb2D3F9E),
                                  fontWeight: FontWeight.bold),
                            ))
                          : ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: schedules.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            child: Column(children: <Widget>[
                                          Text(
                                            new DateFormat.d().format(
                                                DateTime.parse(schedules[index]
                                                    ["SchedDate"])),
                                            style: TextStyle(
                                                color: const Color(0xffb2D3F9E),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            new DateFormat.E().format(
                                                DateTime.parse(schedules[index]
                                                    ["SchedDate"])),
                                            style: TextStyle(
                                                color: const Color(0xffb2D3F9E),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ])),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: makeListTile(schedules[index]),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ))
                ],
              ),
        drawer: new CustomDrawer());
  }
}
