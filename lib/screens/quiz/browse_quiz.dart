import 'package:demo3/model/Category.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:demo3/services/Impl/quiz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseQuizPage extends StatelessWidget {
  final Category category;
  final QuizService _quizService = new QuizService();

  BrowseQuizPage({Key? key, required this.category,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  HeaderCategory("Quiz"),

                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: _quizService
                        .getQuizByCategory(category.name)
                        .length,
                    itemBuilder: (BuildContext context,
                        int index,) {
                      return GestureDetector(
                          onTap: () {
                            print(_quizService.getQuizByCategory(
                                category.name)[index].title);
                          },
                          child: CategoryListContainer(
                              _quizService.getQuizByCategory(
                                  category.name)[index].title)
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



