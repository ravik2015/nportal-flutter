import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';

import './../components/DetailsModal.dart';
import './../widgets/CustomDrawer.dart';
import './../models/schedule_model.dart';
import './../widgets/CustomWeekChange.dart';

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
  @override
  void initState() {
    super.initState();
    String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);
    print(formatDate);
    schedules = data;
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
    ListTile makeListTile(Schedule schedule) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(children: <Widget>[
              Text(
                new DateFormat("d").format(schedule.date),
                style: TextStyle(
                    color: const Color(0xffb2D3F9E),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                new DateFormat("EE").format(schedule.date),
                style: TextStyle(
                    color: const Color(0xffb2D3F9E),
                    fontWeight: FontWeight.bold),
              )
            ]),
          ),
          title: Text(
            schedule.name,
            style: TextStyle(
                color: const Color(0xffb2D3F9E), fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment(-1.0, 0.0),
                  child: Text(schedule.time,
                      style: TextStyle(color: const Color(0xffb2D3F9E)))),
              Container(
                  alignment: Alignment(-1.0, 0.0),
                  child: Text(schedule.status,
                      style: TextStyle(color: const Color(0xffb2D3F9E)))),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: const Color(0xffb2D3F9E), size: 30.0),
          onTap: () {
            print("details");
            _askedToLead();
          },
        );

    Card makeCard(Schedule schedule) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: makeListTile(schedule),
          ),
        );

    return Scaffold(
        appBar: new GradientAppBar(
            title: new Text("My Schedule"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: new Column(
          children: <Widget>[
            new Expanded(
                child: Container(
                    alignment: Alignment(1.0, 1.0), child: CustomWeekChange())),
            new Expanded(
                flex: 10,
                child: Center(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: schedules.length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeCard(schedules[index]);
                    },
                  ),
                ))
          ],
        ),
        drawer: new CustomDrawer());
  }
}
