import 'package:demo3/model/Category.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/Impl/quiz_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/quiz_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrowseQuizPage extends StatefulWidget {
  final Category category;

  BrowseQuizPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _BrowseQuizPageState createState() => _BrowseQuizPageState();
}

class _BrowseQuizPageState extends State<BrowseQuizPage> {
  QuizBloc? _bloc;
  final IQuizRepository _quizService = ServiceProvider().getQuizService();

  @override
  void initState() {
    super.initState();
    _bloc = QuizBloc(1);
  }

  void refresh() {
    setState(() {
      _bloc!.fetchQuizByCategoryId(widget.category.categoryId);
    });
  }

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
              RefreshIndicator(
                  onRefresh: () => _bloc!.fetchQuizByCategoryId(1),
                  child: StreamBuilder<ApiResponse<List<Quiz>>>(
                      stream: _bloc!.quizListStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.LOADING:
                              return SpinKitDoubleBounce(
                                  color: Colors.lightBlue.shade100);
                            case Status.COMPLETED:

                            case Status.ERROR:
                              return SingleChildScrollView(
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
                                                .fetchQuizByCategoryName(
                                                    widget.category.name)
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
                                                        builder: (context) =>
                                                            QuizPage(
                                                          quiz: _quizService
                                                              .fetchQuizById(_quizService
                                                                  .fetchQuizByCategoryName(
                                                                      widget
                                                                          .category
                                                                          .name)[
                                                                      index]
                                                                  .id),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: QuizListContainer(
                                                      _quizService
                                                          .fetchQuizByCategoryName(
                                                              widget.category
                                                                  .name)[index]
                                                          .title,
                                                      _quizService
                                                          .fetchQuizByCategoryName(
                                                              widget.category
                                                                  .name)[index]
                                                          .difficulty));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              break;
                          }
                        }
                        return Text("No data");
                      })),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
