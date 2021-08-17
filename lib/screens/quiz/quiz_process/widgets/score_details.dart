import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreDetails extends StatelessWidget {
  final List<QuestionAttempt> _questionAttempts;

  ScoreDetails({required List<QuestionAttempt> questionAttempts}) : this._questionAttempts = questionAttempts;

  double calculateScore() {
    double score = 0.0;
    int numOfGoodAnswer = 0;
    _questionAttempts.forEach((element) {
      if (element.goodAnswer) numOfGoodAnswer++;
    });
    score = numOfGoodAnswer / _questionAttempts.length;
    return score;
  }

  Color getColor() {
    if (calculateScore() >= 0.6) {
      return Colors.orange.shade400;
    }
    return Color(0xFFFA2424);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1.9],
                  colors: [
                    Color(0xff03C3FF),
                    Colors.lightBlue,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, right: 25),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Quiz is Over!",
                      style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 13.0,
                    animation: true,
                    backgroundColor: Colors.white,
                    percent: calculateScore(),
                    center: Text(
                      (calculateScore() * 100).floor().toString() + "%",
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: getColor(),
                  ),
                  // Container(
                  //   height: 150,
                  //   width: 150,
                  //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       border: Border.all(
                  //         width: 3,
                  //         color: Colors.orange,
                  //       )),
                  //   child: Align(
                  //       alignment: Alignment.center,
                  //       child: Column(
                  //         children: [
                  //           Text(
                  //             "Score",
                  //             style: TextStyle(color: Colors.black, fontSize: 30),
                  //           ),
                  //           Text(
                  //             "75%",
                  //             style: TextStyle(color: Colors.lightGreenAccent[400], fontSize: 40),
                  //           ),
                  //         ],
                  //       )),
                  // ),
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
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              Text("allo ",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                              Text(" min",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 1.5,
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("allo",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                              Text(" Questions",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff03C3FF), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Try Again",
                              style: TextStyle(color: Color(0xff03C3FF), fontSize: 15),
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff03C3FF), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Color(0xff03C3FF), fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
