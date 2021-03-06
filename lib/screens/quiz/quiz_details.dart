import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class QuizDetailsPage extends StatelessWidget {
  final Quiz quiz;

  QuizDetailsPage({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.deepOrange,
                          Colors.orangeAccent.shade400,
                        ],
                      )),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Text(
                            quiz.quizTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(height: 120),
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
                                      Text(" " + quiz.timelimit,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                                      Text(" min",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
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
                                      Text(quiz.noOfQuestions,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                                      Text(" Questions",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Instructions:",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2,
                                        ),
                                      ),
                                      child: Html(
                                        data: quiz.instructions,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          LoginButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizPage(
                                      quiz: quiz,
                                      isAlreadyStarted: false,
                                    ),
                                  ),
                                );
                              },
                              text: AppLocalizations.of(context)!.translate("Start").toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
