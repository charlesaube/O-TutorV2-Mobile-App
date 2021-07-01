import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizState createState() {
    return QuizState();
  }
}

class QuizState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Quiz"),
      ),
    );
  }
}
