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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "You have answered Wrong",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.lightBlue,
                        width: 2.0,
                      ),
                    ),
                    elevation: 10,
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.center,
                        child: Html(
                          data: _question.content,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Your answer: " + fetchUserAnswer(),
            style: TextStyle(fontSize: 17),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "The good answer is " + _question.shortAnswers!.first.answerText.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2.5), borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Html(
                  data: _question.explanation,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
