import 'package:demo3/model/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final Quiz quiz;

  QuizPage({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Quiz"),
      ),
    );
  }

}
