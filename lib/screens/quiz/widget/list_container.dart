import 'package:demo3/model/quiz.dart';
import 'package:demo3/services/Impl/category_service.dart';
import 'package:demo3/services/Impl/quiz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryListContainer extends StatelessWidget {
  final String _categoryName;
  final CategoryService _categoryService = new CategoryService();
  final QuizService _quizService = new QuizService();

  CategoryListContainer(this._categoryName);

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
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.science, color: Colors.white),
            Text(" "+ _categoryName, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
          ),
          Row(
            children: <Widget>[
              Text("(" + _quizService.getQuizByCategory("physique" ).length.toString() + ")", style: TextStyle(color: Colors.white, fontSize: 15)),
              Icon(Icons.navigate_next, color: Colors.white),],
          ),

        ],
      ),
    );
  }
}
