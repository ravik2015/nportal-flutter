import 'package:flutter/material.dart';

class PotentialPatientDetails extends StatelessWidget {
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
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                      ),
                      Text(
                        "28",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Patient Gender",
                        style: TextStyle(
                            fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                      ),
                      Text(
                        "Male",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Zip Code",
                        style: TextStyle(
                            fontSize: 16.5, color: const Color(0xffb2D3E9D)),
                      ),
                      Text(
                        "246149",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.5,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
