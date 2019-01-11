import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomWeekChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
          alignment: Alignment(0.0, 0.0),
          child: GestureDetector(
              onTap: () {
                print("onTap called.");
              },
              child: Icon(Icons.keyboard_arrow_left,
                  color: const Color(0xffb2D3F9E), size: 30.0))),
      Container(
          alignment: Alignment(0.0, 0.0),
          child: Text(new DateFormat().format(DateTime.now()),
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color(0xffb2D3F9E), fontSize: 18))),
      Container(
        alignment: Alignment(0.0, 0.0),
        child: GestureDetector(
            onTap: () {
              print("onTap called.");
            },
            child: Icon(Icons.keyboard_arrow_right,
                color: const Color(0xffb2D3F9E), size: 35.0)),
      )
    ]));
  }
}
