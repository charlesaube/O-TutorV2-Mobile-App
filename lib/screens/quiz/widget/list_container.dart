import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';

import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CoursesListContainer extends StatelessWidget {
  final Group group;

  CoursesListContainer(this.group);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 50, child: Image.network(group.image)),
              Column(
                children: [
                  Text(" " + group.description, //Affiche la description car le courseName est vide
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        group.assignedQuizzes!.length.toString() +
                            " " +
                            AppLocalizations.of(context)!.translate('Assigned Quiz').toString(),
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  )
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.navigate_next,
                color: Colors.orange,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuizListContainer extends StatelessWidget {
  final Quiz _quiz;

  QuizListContainer(this._quiz);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" " + _quiz.quizTitle,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: <Widget>[
              // Text(AppLocalizations.of(context)!.translate('Questions').toString() + ": " + _quiz.noOfQuestions,
              //     style: TextStyle(color: Colors.white, fontSize: 15)),
              Icon(
                Icons.navigate_next,
                color: Colors.orange,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuizAttemptListContainer extends StatelessWidget {
  final QuizAttempt _quizAttempt;

  QuizAttemptListContainer(this._quizAttempt);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" " + _quizAttempt.id.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: <Widget>[
              Text(_quizAttempt.isOver ? _quizAttempt.computeScore().toString() + '%' : "Quiz not finished!",
                  style: TextStyle(
                      color: _quizAttempt.isOver ? Colors.orange[400] : Colors.red,
                      fontSize: _quizAttempt.isOver ? 25 : 10,
                      fontWeight: FontWeight.bold)),
              Icon(
                Icons.navigate_next,
                color: Colors.orange,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  final Widget _child;

  const BaseContainer(this._child);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: _child);
  }
}
