import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleChoiceExplanation extends StatelessWidget {
  final Question question;
  Color _colorContainer = Colors.blue;
  final QuestionAttempt questionAttempt;
  int _clicked = -1;
  late final String titleText;

  MultipleChoiceExplanation({Key? key, required this.question, required this.questionAttempt}) : super(key: key) {
    if (questionAttempt.goodAnswer) {
      this.titleText = "You've answered right!";
    } else {
      this.titleText = "You've answered wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: MediaQuery.of(context).size.height / 1.1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              titleText,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ),
          Card(
            elevation: 10,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.width / 3,
                padding: EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    question.content,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Expanded(
                child: ListView.builder(
                  itemCount: question.multipleAnswers!.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    //Change la couleur du container ClickÃ© ------------------------
                    _colorContainer = Colors.grey.shade200;
                    if (question.multipleAnswers![index].isTrue) {
                      _colorContainer = Colors.green;
                    }

                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: _colorContainer, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              this.question.multipleAnswers![index].answer,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    question.explanation,
                    textAlign: TextAlign.justify,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
