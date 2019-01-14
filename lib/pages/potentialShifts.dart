import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './../widgets/CustomDrawer.dart';
import './../components/PotentialShiftCard.dart';

class PotentialShiftsPage extends StatefulWidget {
  @override
  _PotentialShiftsPageState createState() => _PotentialShiftsPageState();
}

class _PotentialShiftsPageState extends State<PotentialShiftsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> skills = ["1", "2", "Third", "4"];

    return Scaffold(
        appBar: new GradientAppBar(
            title: new Text("Potential Cases"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: new ListView.builder(
            itemCount: skills.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new PotentialShiftCard();
            }),
        drawer: new CustomDrawer());
  }
}
