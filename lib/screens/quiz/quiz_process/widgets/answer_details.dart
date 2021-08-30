import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AnswerDetailsButton extends StatelessWidget {
  final VoidCallback _callback;
  Color dialogColor = Colors.green;
  final bool isTrue;
  final String answerText;

  AnswerDetailsButton({required VoidCallback onPressed, required String answerText, required bool isTrue})
      : this._callback = onPressed,
        this.answerText = answerText,
        this.isTrue = isTrue {
    if (isTrue) {
      this.dialogColor = Color(0xff2dcb70);
    } else {
      this.dialogColor = Color(0xffcc3333);
    }
  }

  Widget fetchAlertDialog() {
    if (isTrue) {
      return CorrectAnswerDialog(
        answer: answerText,
      );
    } else {
      return IncorrectAnswerDialog(
        answer: answerText,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(AppLocalizations.of(context)!.translate('Next').toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
        onPressed: () {
          if (answerText != "")
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
                            Container(
                              decoration: BoxDecoration(
                                color: dialogColor,
                                borderRadius: BorderRadius.all(Radius.circular(90)),
                              ),
                              margin: EdgeInsets.all(35),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextButton(
                                onPressed: _callback,
                                child: Text(AppLocalizations.of(context)!.translate('Next Question').toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
            );
        });
  }
}

class CorrectAnswerDialog extends StatelessWidget {
  final String _answer;
  CorrectAnswerDialog({required String answer}) : this._answer = answer;
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
          Text(
            AppLocalizations.of(context)!.translate('Congrats').toString(),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(AppLocalizations.of(context)!.translate('Correct Answer').toString(),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
          )
        ],
      ),
    );
  }
}

class IncorrectAnswerDialog extends StatelessWidget {
  final String _answer;
  IncorrectAnswerDialog({required String answer}) : this._answer = answer;
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
          Text(
            AppLocalizations.of(context)!.translate('Incorrect').toString(),
            style: TextStyle(fontSize: 25),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(_answer + ' ' + AppLocalizations.of(context)!.translate('Incorrect Answer').toString(),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
