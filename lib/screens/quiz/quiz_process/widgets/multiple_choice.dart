import 'package:demo3/model/answer.dart';
import 'package:demo3/model/question.dart';
import 'package:flutter/material.dart';

typedef void VoidCallback(Answer newAnswer);

class MultipleChoice extends StatefulWidget {
  final Question question;
  final VoidCallback setAnswerCallback;
  MultipleChoice({Key? key, required this.question, required this.setAnswerCallback}) : super(key: key);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Color _colorContainer = Colors.blue;
  int _clicked = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: MediaQuery.of(context).size.width / 1.5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: this.widget.question.multipleAnswers!.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          //Change la couleur du container ClickÃ© ------------------------
          print(_clicked);
          _colorContainer = Colors.grey.shade200;
          if (index == _clicked) _colorContainer = Colors.lightBlue;

          return Container(
            height: 50,
            margin: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: _colorContainer, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 6,
              child: InkWell(
                splashColor: Colors.lightBlue.withAlpha(50),
                onTap: () {
                  setState(() {
                    _clicked = index;
                  });
                  widget.setAnswerCallback(this.widget.question.multipleAnswers![index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.widget.question.multipleAnswers![index].answer,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
