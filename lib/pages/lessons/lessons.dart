import 'package:nurseportal/models/lesson.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';

import './../../widgets/CustomDrawer.dart';

import 'package:flutter/material.dart';
import './detail_page.dart';
import './../../models/schedule_model.dart';

class Lessons extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'Lessons'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = data;
    super.initState();
  }

  @override
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
            // _askedToLead();
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
    // ListTile makeListTile(Lesson lesson) => ListTile(
    //       contentPadding:
    //           EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //       leading: Container(
    //         padding: EdgeInsets.only(right: 12.0),
    //         decoration: new BoxDecoration(
    //             border: new Border(
    //                 right: new BorderSide(
    //                     width: 1.0, color: const Color(0xffb2D3F9E)))),
    //         child: Icon(Icons.autorenew, color: const Color(0xffb2D3F9E)),
    //       ),
    //       title: Text(
    //         lesson.title,
    //         style: TextStyle(
    //             color: const Color(0xffb2D3F9E), fontWeight: FontWeight.bold),
    //       ),
    //       // subtitle: Text("Intermediate", style: TextStyle(color: const Color(0xffb2D3F9E))),

    //       subtitle: Row(
    //         children: <Widget>[
    //           Expanded(
    //               flex: 1,
    //               child: Container(
    //                 // tag: 'hero',
    //                 child: LinearProgressIndicator(
    //                     backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
    //                     value: lesson.indicatorValue,
    //                     valueColor: AlwaysStoppedAnimation(Colors.green)),
    //               )),
    //           Expanded(
    //             flex: 4,
    //             child: Padding(
    //                 padding: EdgeInsets.only(left: 10.0),
    //                 child: Text(lesson.level,
    //                     style: TextStyle(color: const Color(0xffb2D3F9E)))),
    //           )
    //         ],
    //       ),
    //       trailing: Icon(Icons.keyboard_arrow_right,
    //           color: const Color(0xffb2D3F9E), size: 30.0),
    //       onTap: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => DetailPage(lesson: lesson)));
    //       },
    //     );

    // Card makeCard(Lesson lesson) => Card(
    //       elevation: 8.0,
    //       margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    //       child: Container(
    //         decoration: BoxDecoration(color: Colors.white),
    //         child: makeListTile(lesson),
    //       ),
    //     );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new GradientAppBar(
            title: Text(widget.title),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: makeBody,
        drawer: new CustomDrawer());
  }
}
