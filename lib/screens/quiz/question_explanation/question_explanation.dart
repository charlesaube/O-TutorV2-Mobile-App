import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/screens/quiz/question_explanation/widget/short_answer.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/multiple_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/multiplechoice_explanation.dart';

class QuestionExplanation extends StatelessWidget {
  final QuizAttempt _quizAttempt;
  final int _questionId;
  late final Color borderColor;

  QuestionExplanation({required QuizAttempt quizAttempt, required int questionId})
      : this._quizAttempt = quizAttempt,
        this._questionId = questionId {
    if (!quizAttempt.questionAttempts[questionId].goodAnswer) {
      this.borderColor = Colors.red;
    } else {
      this.borderColor = Colors.green;
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
              if (_quizAttempt.questions[_questionId].questionType == "multiplechoice")
                MultipleChoiceExplanation(question: _quizAttempt.questions[_questionId]),
              if (_quizAttempt.questions[_questionId].questionType == "shortanswer") ShortAnswerExplanation(),
            ],
          ),
        ),
      ),
    );
  }
}
