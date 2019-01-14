import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final num boxHeight;
  final num boxWidth;
  final String boxHeading;
  final Function onPress;
  SkillItem(this.boxHeight, this.boxWidth, this.boxHeading, this.onPress);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          onPress();
        },
        child: Container(
            // padding: EdgeInsets.only(top: 10),
            alignment: Alignment(0.0, 0.0),
            height: boxHeight,
            width: boxWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffb2D3E9D),
                    const Color(0xffb3098CF),
                  ],
                )),
            child: Text(
              boxHeading,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )));
  }
}
