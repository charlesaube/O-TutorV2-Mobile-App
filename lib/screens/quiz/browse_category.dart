import 'package:demo3/screens/quiz/browse_quiz.dart';
import 'package:demo3/screens/quiz/shapes/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:demo3/services/Impl/category_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseCategoryPage extends StatefulWidget {
  @override
  _BrowseCategoryState createState() {
    return _BrowseCategoryState();
  }
}

class _BrowseCategoryState extends State<BrowseCategoryPage> {
  final CategoryService categoryService = new CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -600,
            right: -350,
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
                      HeaderCategory("Category"),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: categoryService.getAllCategory().length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              print(
                                  categoryService.getAllCategory()[index].name);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BrowseQuizPage(
                                      category: categoryService
                                          .getAllCategory()[index]),
                                ),
                              );
                            },
                            child: CategoryListContainer(
                                categoryService.getAllCategory()[index].name,
                                categoryService.getAllCategory()[index].icon),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
