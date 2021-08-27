import 'package:demo3/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class QuizCard extends StatelessWidget {
  final int questionIndex;
  final List<Question> questions;

  QuizCard({
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 4,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Question " + (questionIndex + 1).toString() + "/",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.orangeAccent)),
                Text(questions.length.toString(), style: TextStyle(fontSize: 12, color: Colors.orangeAccent)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(questions[questionIndex].weight.toString() + " pts", style: TextStyle(color: Colors.lightGreen)),
              ],
            ),
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                    stops: [0.0, 0.1, 0.85, 1.0], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: SingleChildScrollView(
                  child: Html(
                    shrinkWrap: true,
                    data: questions[questionIndex].content,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
