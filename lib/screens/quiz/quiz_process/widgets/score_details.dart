import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/quiz_attempt_bloc.dart';
import 'package:demo3/screens/quiz/question_explanation/question_explanation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreDetails extends StatefulWidget {
  late final List<QuestionAttempt> _questionAttempts;
  final QuizAttempt _quizAttempt;

  ScoreDetails({required QuizAttempt quizAttempt}) : this._quizAttempt = quizAttempt {
    this._questionAttempts = quizAttempt.questionAttempts;
  }

  @override
  _ScoreDetailsState createState() => _ScoreDetailsState();
}

class _ScoreDetailsState extends State<ScoreDetails> {
  int numOfGoodAnswer = 0;
  QuizAttemptBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = QuizAttemptBloc();
  }

  double calculateScore() {
    double score = 0.0;
    numOfGoodAnswer = 0;
    widget._questionAttempts.forEach((element) {
      if (element.goodAnswer) numOfGoodAnswer++;
    });
    score = numOfGoodAnswer / widget._questionAttempts.length;
    return score;
  }

  Color getColor() {
    if (calculateScore() >= 0.6) {
      return Colors.orange.shade400;
    }
    return Color(0xFFFA2424);
  }

  String fetchIconPath(int index) {
    if (widget._questionAttempts[index].goodAnswer) {
      return 'assets/checkMark.png';
    }
    return 'assets/xIcon.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.6, 1],
                  colors: [
                    Color(0xff03C3FF),
                    Colors.blue.shade700,
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
                  Container(
                    margin: EdgeInsets.all(30),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(90, 0, 0, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  Text(
                                    numOfGoodAnswer.toString() + " / " + widget._questionAttempts.length.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 1.5,
                            width: 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  " 7:13 min",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Boutons
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: widget._questionAttempts.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuestionExplanation(quizAttempt: widget._quizAttempt, questionId: index)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: "Q" + (index + 1).toString() + " : ", style: TextStyle(fontSize: 15)),
                              TextSpan(
                                  text: widget._quizAttempt.questions[index].content,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black))
                            ]),
                          ),
                          Row(
                            children: [
                              Image.asset(fetchIconPath(index), height: 15, width: 15),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //Bouton
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 0.0,
                  ),
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
                              style: TextStyle(color: Color(0xff03C3FF), fontSize: 15, fontWeight: FontWeight.bold),
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
                          onPressed: () {
                            _bloc!.saveQuizAttempt(widget._quizAttempt, widget._quizAttempt.quizId);
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Color(0xff03C3FF), fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<ApiResponse<QuizAttempt>>(
                stream: _bloc!.quizAttemptStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case Status.COMPLETED:
                        Navigator.pop(context);
                        break;
                    }
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
