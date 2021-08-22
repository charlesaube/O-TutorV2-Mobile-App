import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/screens/quiz/question_explanation/widget/short_answer_explanation.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/multiple_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/multiplechoice_explanation.dart';

class QuestionExplanation extends StatelessWidget {
  final QuizAttempt _quizAttempt;
  final Question _question;
  late int _index;
  late final Color borderColor;

  QuestionExplanation({required QuizAttempt quizAttempt, required Question question})
      : this._quizAttempt = quizAttempt,
        this._question = question {
    _index = _quizAttempt.questionAttempts.indexWhere((q) => q.questionId == question.questionId);
    if (_index != -1) {
      //Si index = -1 alors il n'y a pas de questionAttempt(utilisateur pas eu le temps de répondre)
      if (quizAttempt.questionAttempts[_index].goodAnswer) {
        this.borderColor = Colors.green;
      } else {
        this.borderColor = Colors.red;
      }
    } else {
      this.borderColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: borderColor, width: 3)),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              if (_question.questionType == "multiplechoice")
                MultipleChoiceExplanation(
                  question: _question,
                  questionAttempt: _quizAttempt.questionAttempts[_index],
                ),
              if (_question.questionType == "shortanswer")
                ShortAnswerExplanation(
                  quizAttempt: _quizAttempt,
                  question: _question,
                  index: _index,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
