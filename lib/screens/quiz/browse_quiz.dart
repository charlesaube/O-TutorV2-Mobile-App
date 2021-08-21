import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/Category.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz/blocs/browse_quiz_bloc.dart';
import 'package:demo3/screens/quiz/quiz_details.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrowseQuizPage extends StatefulWidget {
  late Group group;

  BrowseQuizPage({Key? key, required this.group}) : super(key: key) {
    this.group.id = 23; //Hard coded parce que le groupe 24(le vrai groupe de laura) est unauthorize
  }

  @override
  _BrowseQuizPageState createState() {
    return _BrowseQuizPageState();
  }
}

class _BrowseQuizPageState extends State<BrowseQuizPage> {
  BrowseQuizBloc? _bloc;
  late List<Quiz> _quizzes = [];
  late List<QuizAttempt> _quizAttempts;

  @override
  void initState() {
    super.initState();
    _bloc = BrowseQuizBloc(widget.group.id);
  }

  void refresh() {
    setState(() {
      _bloc!.fetchQuizByGroupId(widget.group.id);
      _bloc!.fetchQuizAttemptsOfUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.group.courseName != "" ? widget.group.courseName : widget.group.description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.orange[700],
      ),
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
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Color.fromARGB(230, 252, 147, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _quizzes.isEmpty
                        ? AppLocalizations.of(context)!.translate("New Quiz").toString()
                        : AppLocalizations.of(context)!.translate("New Quiz").toString() +
                            " (" +
                            _quizzes.length.toString() +
                            ")",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () => _bloc!.fetchQuizByGroupId(widget.group.id),
                  child: StreamBuilder<ApiResponse<List<Quiz>>>(
                      stream: _bloc!.quizListStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.LOADING:
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 3,
                                child: SpinKitDoubleBounce(color: Colors.lightBlue.shade100),
                              );
                            case Status.COMPLETED:
                              _quizzes = snapshot.data!.data;
                              _quizzes.add(Quiz(2, "Quiz 2", "", "", "", "", "", "", "12:00", "", "",
                                  "Complete this quiz as fast as possible", "", "", "", ""));

                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: ListView.builder(
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
                                                    builder: (context) => QuizDetailsPage(
                                                      quiz: _quizzes[index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: QuizListContainer(_quizzes[index]));
                                        },
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
                        return Text(
                          "No data",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        );
                      }),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.zero,
                  color: Color.fromARGB(230, 252, 147, 0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    AppLocalizations.of(context)!.translate("Quiz Attempt").toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () => _bloc!.fetchQuizAttemptsOfUser(),
                  child: StreamBuilder<ApiResponse<List<QuizAttempt>>>(
                      stream: _bloc!.quizAttemptListStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.LOADING:
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2.5,
                                child: SpinKitDoubleBounce(color: Colors.lightBlue.shade100),
                              );
                            case Status.COMPLETED:
                              _quizAttempts = snapshot.data!.data;

                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 2.5,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: _quizAttempts.length,
                                        itemBuilder: (
                                          BuildContext context,
                                          int index,
                                        ) {
                                          return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => QuizDetailsPage(
                                                      quiz: Quiz(2, "Quiz 2", "", "", "", "", "", "", "12:00", "", "",
                                                          "Complete this quiz as fast as possible", "", "", "", ""),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: QuizAttemptListContainer(_quizAttempts[index]));
                                        },
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
                        return Text(
                          "No data",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        );
                      }),
                ),
              ],
            ),
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
