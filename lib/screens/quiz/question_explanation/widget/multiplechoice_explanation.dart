import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MultipleChoiceExplanation extends StatelessWidget {
  final Question question;
  Color _colorContainer = Colors.blue;
  Color _answerColor = Colors.red;
  final QuestionAttempt questionAttempt;
  int _clicked = -1;
  late final String titleText;

  MultipleChoiceExplanation({Key? key, required this.question, required this.questionAttempt}) : super(key: key) {
    if (questionAttempt.goodAnswer) {
      this.titleText = "Answer Right";
      this._answerColor = Colors.green;
    } else {
      this.titleText = "Answer Wrong";
      this._answerColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemCount: question.multipleAnswers!.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    //Change la couleur du container ClickÃ© ------------------------
                    _colorContainer = Colors.grey.shade200;
                    if (question.multipleAnswers![index].isTrue) {
                      _colorContainer = Colors.greenAccent.shade400;
                    } else if (question.multipleAnswers![index].answer == this.questionAttempt.answer) {
                      _colorContainer = Colors.red;
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
                            Expanded(
                              child: Html(
                                shrinkWrap: true,
                                data: this.question.multipleAnswers![index].answer,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
