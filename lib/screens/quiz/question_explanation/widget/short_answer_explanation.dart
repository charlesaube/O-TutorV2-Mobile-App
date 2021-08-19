import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Text(
            "You have answered Wrong",
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
          Text("The question Was: "),
          Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 2)),
              child: Align(alignment: Alignment.center, child: Text(_question.content))),
          Text("your answer: " + fetchUserAnswer()),
          Text("The good answer is " + _question.shortAnswers!.first.answerText.toString()),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              _question.explanation,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
