import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreDetails extends StatelessWidget {
  const ScoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          "Quiz is Over!",
          style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 150,
          width: 150,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Colors.orange,
              )),
          child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Score",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  Text(
                    "75%",
                    style: TextStyle(color: Colors.lightGreenAccent[400], fontSize: 40),
                  ),
                ],
              )),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(60, 30, 0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30,
                    ),
                    Text(
                      "102/50",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Spacer(),
            Container(
                margin: EdgeInsets.fromLTRB(0, 30, 60, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      "7:13 min",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ],
        ),
      ],
    ));
  }
}
