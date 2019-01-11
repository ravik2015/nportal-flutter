import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './../widgets/CustomDrawer.dart';
import './../components/OpenShiftCard.dart';

class PotentialShiftsPage extends StatefulWidget {
  @override
  _PotentialShiftsPageState createState() => _PotentialShiftsPageState();
}

class _PotentialShiftsPageState extends State<PotentialShiftsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new GradientAppBar(
            title: new Text("Potential Cases"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: Container(child: OpenShiftCard()),
        drawer: new CustomDrawer());
  }
}
