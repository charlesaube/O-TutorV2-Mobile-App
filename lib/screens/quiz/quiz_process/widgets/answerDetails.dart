import 'package:demo3/model/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerDetailsButton extends StatelessWidget {
  final VoidCallback _callback;
 // final Answer answer;
  late Answer answer;
  late MaterialColor dialogColor;

  AnswerDetailsButton({required VoidCallback onPressed})
      : this._callback = onPressed;
        // this.answer = answer;

  Widget fetchAlert(){
    if (answer.isTrue)
      {
        dialogColor = Colors.green;
        return CorrectAnswerDialog();
      }
    else{
      dialogColor = Colors.red;
      return IncorrectAnswerDialog();
    }
    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Next",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
      onPressed: () {
        showDialog<String>(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.green),
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

                        Container(
                        child:  CorrectAnswerDialog()
                    )
                      ,
                        Spacer(),
                        Container(
                          child: TextButton(
                            onPressed: _callback,
                            child: Text("Next Question"),
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
            Text("The correct answer was indeed ___", style: TextStyle(fontSize: 17)),
          ],
        ),
    );
  }
}


class IncorrectAnswerDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Image.asset('assets/xIcon.png', height: 60, width: 60),
          ),
          Text("Incorrect !", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("__ is not the correct answer", style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}

