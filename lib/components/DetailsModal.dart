import 'package:flutter/material.dart';

class ScheduleDetails extends StatelessWidget {
  ScheduleDetails(
      // {@required this.index, @required this.onPress}
      );
  // final index;
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title:
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        GestureDetector(
            onTap: () {
              print("onTap called.");
              Navigator.pop(context);
            },
            child:
                Icon(Icons.close, color: const Color(0xffb2D3F9E), size: 20.0))
      ]),
      children: <Widget>[
        new Row(children: <Widget>[
          new Expanded(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset('assets/logo.png', height: 70.0),
                  SizedBox(height: 16.0),
                  new Text(
                    "Jane Doe",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  new Text(
                    "E37, Phase 8 Mohali Punjab",
                    style: TextStyle(
                      color: const Color(0xffb2D3F9E),
                    ),
                  ),
                  new Container(
                    height: 1.0,
                    color: Colors.grey,
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                  ),
                  new Text(
                    "Scheduler Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 16.0),
                  new Text(
                    "P: +1(215) 389-1800 / Ext: 441",
                    style: TextStyle(
                      color: const Color(0xffb2D3F9E),
                    ),
                  ),
                  new Text(
                    "ravi@gmail.com",
                    style: TextStyle(
                      color: const Color(0xffb2D3F9E),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ]),
          ),
        ])
      ],
    );
  }
}
