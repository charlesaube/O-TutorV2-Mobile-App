import 'package:demo3/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget{
  final int questionIndex;
  final List<Question> questions;

  QuizCard({
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left:10, top: 40, right: 10, bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Container(
        width:MediaQuery.of(context).size.width /1.1,
        height: MediaQuery.of(context).size.width /3 ,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Question " +(questionIndex + 1).toString() + "/", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.orangeAccent)),
                Text(questions.length.toString(),style: TextStyle(fontSize: 12, color: Colors.orangeAccent)),

              ],
            ),
            Spacer(),
            Text(questions[questionIndex].question, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
            Spacer(),
          ],
        ),
      ),
    );

  }

}