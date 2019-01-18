import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class CustomWeekChange extends StatelessWidget {
  // a property on this class
  final DateTime firstDayOfTheweek;
  final DateTime lastDayOfTheweek;

  // a constructor for this class
  CustomWeekChange(this.firstDayOfTheweek, this.lastDayOfTheweek);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                      child: Text(
                          "${new DateFormat.MMMd("en_US").format(DateTime.parse(firstDayOfTheweek.toString()))}- ${new DateFormat.yMMMd("en_US").format(DateTime.parse(lastDayOfTheweek.toString()))}",

                          //new DateFormat().format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xffb2D3F9E), fontSize: 18))),
                  Container(
                    alignment: Alignment(0.0, 0.0),
                    child: GestureDetector(
                        onTap: () {
                          print("onTap called.");
                        },
                        child: Icon(Icons.keyboard_arrow_right,
                            color: const Color(0xffb2D3F9E), size: 35.0)),
                  )
                ])));
  }
}
