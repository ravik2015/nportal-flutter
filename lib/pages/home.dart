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
          onTap: () {
            print("details");
            _askedToLead();
          },
        );

    return Scaffold(
        appBar: new GradientAppBar(
            title: new Text("My Schedule"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: new Column(
          children: <Widget>[
            new Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment(1.0, 1.0), child: CustomWeekChange())),
            new Expanded(
                flex: 9,
                child: ListView.builder(
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
                                new DateFormat("d")
                                    .format(schedules[index].date),
                                style: TextStyle(
                                    color: const Color(0xffb2D3F9E),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                new DateFormat("EE")
                                    .format(schedules[index].date),
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
