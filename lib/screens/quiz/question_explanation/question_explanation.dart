import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/screens/quiz/question_explanation/widget/short_answer_explanation.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/multiple_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'widget/multiplechoice_explanation.dart';

class QuestionExplanation extends StatelessWidget {
  final QuizAttempt _quizAttempt;
  final Question _question;
  late int _index;
  late Color borderColor;
  late String titleText;
  late Color _answerColor;

  QuestionExplanation({required QuizAttempt quizAttempt, required Question question})
      : this._quizAttempt = quizAttempt,
        this._question = question {
    _index = _quizAttempt.questionAttempts.indexWhere((q) => q.questionId == question.questionId);

    this.titleText = "Answer Wrong";
    this.borderColor = Colors.red;
    this._answerColor = Colors.red;
    if (_index != -1) {
      //Si index = -1 alors il n'y a pas de questionAttempt(utilisateur pas eu le temps de répondre)
      if (quizAttempt.questionAttempts[_index].goodAnswer) {
        this.borderColor = Colors.greenAccent.shade400;
        this.titleText = "Answer Right";
        this._answerColor = Colors.greenAccent.shade400;
      }
    }
  }
  String fetchIconPath() {
    if (_index != -1) {
      if (_quizAttempt.questionAttempts[_index].goodAnswer) {
        return 'assets/checkMark.png';
      }
    }

    return 'assets/xIcon.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Column(children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.6, 1],
                colors: [
                  Color(0xff03C3FF),
                  Colors.blue.shade700,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.asset(fetchIconPath(), height: 30, width: 30),
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate(titleText).toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 4,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.translate("Statement").toString(),
                            style: TextStyle(fontSize: 25, color: Colors.orange, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Html(
                                shrinkWrap: true,
                                data: _question.content,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          if (_question.questionType == "multiplechoice")
            MultipleChoiceExplanation(
              question: _question,
              questionAttempt: _quizAttempt.questionAttempts[_index],
            ),
          if (_question.questionType == "shortanswer")
            ShortAnswerExplanation(
              quizAttempt: _quizAttempt,
              question: _question,
              index: _index,
            ),
        ]),
        DraggableScrollableSheet(
            initialChildSize: 0.12,
            minChildSize: 0.12,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.orange, width: 3),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.arrow_drop_up,
                        size: 40,
                      ),
                      SingleChildScrollView(
                        controller: ScrollController(),
                        child: Text(
                          AppLocalizations.of(context)!.translate("Explanation").toString(),
                          style: TextStyle(fontSize: 25, color: Colors.orange, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Html(
                        shrinkWrap: true,
                        data: _question.explanation,
                      ),
                    ]),
                  ));
            }),
      ]),
    );
  }
}
