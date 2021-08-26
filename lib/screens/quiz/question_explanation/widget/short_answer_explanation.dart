import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ShortAnswerExplanation extends StatelessWidget {
  final QuizAttempt _quizAttempt;
  final Question _question;
  final int _index;

  ShortAnswerExplanation({required QuizAttempt quizAttempt, required Question question, required int index})
      : this._quizAttempt = quizAttempt,
        this._question = question,
        this._index = index;

  String fetchUserAnswer() {
    if (_index != -1) {
      //Si index = -1 alors il n'y a pas de questionAttempt(utilisateur pas eu le temps de répondre)
      return _quizAttempt.questionAttempts[_index].answer;
    }
    return "";
  }

  String fetchIconPath() {
    if (_index != -1) {
      if (_quizAttempt.questionAttempts[_index].goodAnswer) {
        return 'assets/checkMark.png';
      }
    }

    return 'assets/xIcon.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.translate("Your Answer").toString(),
                  style: TextStyle(fontSize: 25, color: Colors.orange),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fetchUserAnswer(),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Image.asset(fetchIconPath(), height: 15, width: 15),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.translate("Accepted Answer").toString(),
                  style: TextStyle(fontSize: 25, color: Colors.orange),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                      itemCount: _question.shortAnswers!.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        /*if (_question.shortAnswers![index].answer.toString() == fetchUserAnswer()) {*/
                        return SingleChildScrollView(
                          controller: ScrollController(),
                          child: Container(
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Answer " + (index + 1).toString() + " : ", style: TextStyle(fontSize: 15)),
                                TextSpan(
                                    text: _question.shortAnswers![index].answerText.toString(),
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                              ]),
                            ),
                          ),
                        );
                        /*}
                      return Container();*/
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
