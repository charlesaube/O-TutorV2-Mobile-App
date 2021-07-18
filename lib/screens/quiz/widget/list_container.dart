import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/services/Impl/category_service.dart';
import 'package:demo3/network/services/Impl/quiz_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
             SizedBox(height: 50,child: Image.network(group.image)),
              Text(" " + group.description,//Affiche la description car le courseName est vide
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                  "(" +
                     group.assignedQuizzes!.length.toString() +
                      ")",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Icon(Icons.navigate_next, color: Colors.white),
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
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Row(
            children: <Widget>[
              Text(AppLocalizations.of(context)!.translate('Questions').toString() + ": " + _quiz.noOfQuestions,
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Icon(Icons.navigate_next, color: Colors.white),
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
        padding: EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 45),
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
