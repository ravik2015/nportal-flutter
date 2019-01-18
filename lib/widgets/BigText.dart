import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  // a property on this class
  final String text;

  // a constructor for this class
  BigText(this.text);

  Widget build(context) {
    // Pass the text down to another widget
    return new Text(
      text,
      // Even changing font-style is done through a Dart class.
      style: new TextStyle(fontSize: 20.0),
    );
  }
}
