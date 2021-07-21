import 'package:demo3/model/Category.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/Impl/quiz_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz/blocs/browse_quiz_bloc.dart';
import 'package:demo3/screens/quiz/quiz_details.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/quiz_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrowseQuizPage extends StatefulWidget {
  late int groupId;

  BrowseQuizPage({
    Key? key,
    required this.groupId,
  }) : super(key: key) {
    this.groupId =
        23; //Hard coded parce que le groupe 24(le vrai groupe de laura) est unauthorize
  }


  @override
  _BrowseQuizPageState createState(){
    return _BrowseQuizPageState();
  }
}

class _BrowseQuizPageState extends State<BrowseQuizPage> {
  BrowseQuizBloc? _bloc;
  late List<Quiz> _quizzes;

  @override
  void initState() {
    super.initState();
    _bloc = BrowseQuizBloc(widget.groupId);
  }

  void refresh() {
    setState(() {
      _bloc!.fetchQuizByGroupId(widget.groupId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
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
                onRefresh: () => _bloc!.fetchQuizByGroupId(widget.groupId),
                child: StreamBuilder<ApiResponse<List<Quiz>>>(
                    stream: _bloc!.quizListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: SpinKitDoubleBounce(
                                  color: Colors.lightBlue.shade100),
                            );
                          case Status.COMPLETED:
                            _quizzes = snapshot.data!.data;

                            return SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      children: <Widget>[
                                        HeaderCategory("Quiz"),
                                        ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: _quizzes.length,
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
                                                          QuizDetailsPage(
                                                        quiz: _quizzes[index],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: QuizListContainer(
                                                    _quizzes[index]));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            break;

                          case Status.ERROR:
                            return ErrorPopUp(snapshot, refresh);
                            break;
                        }
                      }
                      return Text("No data");
                    })),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
