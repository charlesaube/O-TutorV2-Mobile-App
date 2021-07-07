import 'package:demo3/model/question.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/services/Impl/question_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final QuestionService _questionService = new QuestionService();
  final Quiz quiz;
  List<Question> _questions = [];

  QuizPage({Key? key, required this.quiz}) : super(key: key) {
    this._questions = _questionService.getQuestionByQuizId(quiz.id);
  }

  @override
  _QuizState createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizPage> {
  @override
  QuizPage get widget => super.widget;

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < widget._questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          children: <Widget>[
            if(_questionIndex < widget._questions.length)
              Text(widget._questions[_questionIndex].question),

            TextButton(
              child: Text(
               "Next"
              ),
              onPressed: () {
                _answerQuestion();
              },
            ),
          ],
        ),

        )
      );
  }
}

