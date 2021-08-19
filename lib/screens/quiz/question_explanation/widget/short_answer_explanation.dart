import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortAnswerExplanation extends StatelessWidget {
  final QuizAttempt _quizAttempt;
  final int index;

  ShortAnswerExplanation({required QuizAttempt quizAttempt, required int quizId})
      : this._quizAttempt = quizAttempt,
        this.index = quizId;
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
              child: Align(alignment: Alignment.center, child: Text(_quizAttempt.questions[index].content))),
          Text("your answer: " + _quizAttempt.questionAttempts[index].answer),
          Text("The good answer is " + _quizAttempt.questions[index].shortAnswers!.first.answerText.toString()),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              _quizAttempt.questions[index].explanation,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
