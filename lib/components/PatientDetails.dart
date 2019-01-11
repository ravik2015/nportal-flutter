import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                      ),
                      Text(
                        "12-12-2019",
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 16.5,
                          color: const Color(0xffb2D3E9D),
                        ),
                      ),
                      Text(
                        "9am - 12am",
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                      ),
                      Text(
                        "28",
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Patient Gender",
                          style: TextStyle(
                              fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 16.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Zip Code",
                          style: TextStyle(
                              fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                        ),
                        Text(
                          "246149",
                          style: TextStyle(
                            fontSize: 16.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text(""), Text("")],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
