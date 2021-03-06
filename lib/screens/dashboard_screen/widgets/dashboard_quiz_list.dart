import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_browsing/blocs/browse_quiz_bloc.dart';
import 'package:demo3/screens/quiz/quiz_browsing/quiz_attempt_details.dart';
import 'package:demo3/screens/quiz/quiz_details.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/quiz_attempt_bloc.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardQuizList extends StatefulWidget {
  @override
  _DashboardQuizListState createState() => _DashboardQuizListState();
}

class _DashboardQuizListState extends State<DashboardQuizList> {
  BrowseQuizBloc? _bloc;
  late List<QuizAttempt> _quizAttempts;
  final bool isHover = false;

  @override
  void initState() {
    super.initState();
    _bloc = BrowseQuizBloc(1);
  }

  //enleve les quiz attempts terminés de la liste
  List<QuizAttempt> filterQuizAttempt(List<QuizAttempt> qa) {
    List<QuizAttempt> temp = [];

    for (int i = 0; i < qa.length; i++) {
      temp.add(qa[i].clone());
    }

    for (int i = 0; i < temp.length; i++) {
      if (qa[i].isOver) {
        temp.remove(temp[i]);
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
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
                    _quizAttempts = filterQuizAttempt(snapshot.data!.data);
                    if (_quizAttempts.isNotEmpty) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _quizAttempts.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.amber.shade800,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuizAttemptDetailsPage(quizAttempt: _quizAttempts[index])));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _quizAttempts[index].id.toString() + " (" + ")",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.translate('No on going quizzes').toString(),
                          style: TextStyle(fontSize: 18, color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    break;

                  case Status.ERROR:
                    break;
                }
              }
              return Align(alignment: Alignment.center, child: SpinKitDoubleBounce(color: Colors.lightBlue.shade100));
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
