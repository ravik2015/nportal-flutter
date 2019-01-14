import 'package:flutter/material.dart';
import './../widgets/SkillItem.dart';
import './PotentialPatientDetails.dart';

class PotentialShiftCard extends StatefulWidget {
  @override
  PotentialShiftCardState createState() => new PotentialShiftCardState();
}

class PotentialShiftCardState extends State<PotentialShiftCard> {
  PotentialShiftCardState(
      // {@required this.index, @required this.onPress}
      );
  // final index;
  // final Function onPress;
  bool showMoreFlag = false;

  void _showMore() {
    setState(() {
      showMoreFlag = !this.showMoreFlag;
    });
  }

  bool setFavFlag = false;

  void _setFav() {
    setState(() {
      setFavFlag = !this.setFavFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        // margin: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
            height: this.showMoreFlag ? 200 : 170,
            width: double.infinity,
            child: new Container(
                // padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: new Center(
                    child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(22, 16.5, 0, 16.5),
                        child: Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xffb3098CF),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )),
                      GestureDetector(
                          onTap: () {
                            _setFav();
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 16.5, 22, 16.5),
                            child: Icon(
                              setFavFlag
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: const Color(0xffb3098CF),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SkillItem(30.00, 120.00, "Trache & Vent", () {
                        print('Trache & Vent');
                      }),
                      SkillItem(30.00, 80.00, "Asthama", () {
                        print('Trache & Vent');
                      }),
                      SkillItem(30.00, 90.00, "Cast/Care", () {
                        print('Trache & Vent');
                      }),
                      SkillItem(30.00, 50.00, "+2", () {
                        _showMore();
                      }),
                    ],
                  ),
                  this.showMoreFlag
                      ? Container(
                          margin: new EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SkillItem(30.00, 120.00, "Trache & Vent", () {
                                print('Trache & Vent');
                              }),
                              SkillItem(30.00, 80.00, "Asthama", () {
                                print('Trache & Vent');
                              }),
                            ],
                          ))
                      : new Container(),
                  PotentialPatientDetails()
                ],
              ),
            )))));
  }
}
