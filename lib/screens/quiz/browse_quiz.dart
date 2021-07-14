import 'package:demo3/model/Category.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/Impl/quiz_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseQuizPage extends StatelessWidget {
  final Category category;

  final IQuizRepository _quizService = ServiceProvider().getQuizService();

  BrowseQuizPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                bottom: -600,
                right: -350,
                height: 620,
                child: CustomPaint(
                  size: Size(370, (360 * 1.6666666666666667).toDouble()),
                  painter: RPSCustomPainter180(),
                ),
              ),
              SingleChildScrollView(
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
                                .fetchQuizByCategory(category.name)
                                .length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizPage(
                                          quiz: _quizService.fetchQuizById(
                                              _quizService
                                                  .fetchQuizByCategory(
                                                      category.name)[index]
                                                  .id),
                                        ),
                                      ),
                                    );
                                  },
                                  child: QuizListContainer(
                                      _quizService
                                          .fetchQuizByCategory(
                                              category.name)[index]
                                          .title,
                                      _quizService
                                          .fetchQuizByCategory(
                                              category.name)[index]
                                          .difficulty));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
