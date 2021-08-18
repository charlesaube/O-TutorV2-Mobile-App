import 'package:demo3/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleChoiceExplanation extends StatelessWidget {
  final Question question;
  Color _colorContainer = Colors.blue;
  int _clicked = -1;
  MultipleChoiceExplanation({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: MediaQuery.of(context).size.width / 1.5,
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
    );
  }
}
