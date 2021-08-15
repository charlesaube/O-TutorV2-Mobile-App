import 'package:demo3/model/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerDetailsButton extends StatelessWidget {
  final VoidCallback _callback;
  final Answer answer;
  Color dialogColor = Colors.green;

  AnswerDetailsButton({required VoidCallback onPressed, required Answer answer})
      : this._callback = onPressed,
        this.answer = answer {
    if (answer.isTrue) {
      this.dialogColor = Color(0xff2dcb70);
    } else {
      this.dialogColor = Color(0xffcc3333);
    }
  }

  Widget fetchAlertDialog() {
    if (answer.isTrue) {
      return CorrectAnswerDialog(
        answer: answer,
      );
    } else {
      return IncorrectAnswerDialog(
        answer: answer,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
      onPressed: () {
        showDialog<String>(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: dialogColor),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return Container(
                    height: height / 2,
                    width: width / 1.2,
                    child: Column(
                      children: [
                        Container(child: fetchAlertDialog()),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: dialogColor,
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                          ),
                          margin: EdgeInsets.all(35),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextButton(
                            onPressed: _callback,
                            child: Text("Next Question", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        );
      },
    );
  }
}

class CorrectAnswerDialog extends StatelessWidget {
  final Answer _answer;
  CorrectAnswerDialog({required Answer answer}) : this._answer = answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Image.asset('assets/checkMark.png', height: 60, width: 60),
          ),
          Text("Congrats !", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("The correct answer was indeed " + _answer.answer, style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}

class IncorrectAnswerDialog extends StatelessWidget {
  final Answer _answer;
  IncorrectAnswerDialog({required Answer answer}) : this._answer = answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Image.asset('assets/xIcon.jpg', height: 60, width: 60),
          ),
          Text("Incorrect !", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text(_answer.answer + " is not the correct answer", style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
