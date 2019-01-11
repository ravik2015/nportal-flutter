import 'package:flutter/material.dart';
import './../pages/login.dart';
import './../pages/home.dart';
import './../pages/lessons/lessons.dart';
import './../pages/openShifts.dart';
import './../pages/potentialShifts.dart';

class Routes extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LoginPage(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/home': (context) => Home(),
        '/openShifts': (context) => OpenShiftsPage(),
        '/potentialShifts': (context) => PotentialShiftsPage(),

        '/lesson': (context) => Lessons(),
      },
    );
  }
}
