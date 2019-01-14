import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './../widgets/CustomDrawer.dart';
import './../components/OpenShiftCard.dart';

class OpenShiftsPage extends StatefulWidget {
  @override
  _OpenShiftsPageState createState() => _OpenShiftsPageState();
}

class _OpenShiftsPageState extends State<OpenShiftsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    List<String> skills = ["1", "2", "Third", "4"];
    return new Scaffold(
        appBar: new GradientAppBar(
            title: new Text("Open Shifts"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: new ListView.builder(
            itemCount: skills.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return OpenShiftCard();
            }),
        drawer: Drawer(
          child: CustomDrawer(),
        ));
  }
}
