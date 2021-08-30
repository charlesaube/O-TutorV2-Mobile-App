import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'blocs/quiz_details_bloc.dart';

class QuizAttemptDetailsPage extends StatefulWidget {
  final QuizAttempt quizAttempt;

  QuizAttemptDetailsPage({Key? key, required this.quizAttempt}) : super(key: key);

  @override
  _QuizAttemptDetailsPageState createState() => _QuizAttemptDetailsPageState();
}

class _QuizAttemptDetailsPageState extends State<QuizAttemptDetailsPage> {
  QuizDetailsBloc? _bloc;
  late Quiz _quiz;

  @override
  void initState() {
    super.initState();
    _bloc = QuizDetailsBloc(widget.quizAttempt.quizId);
  }

  void refresh() {
    setState(() {
      _bloc!.fetchQuizById(widget.quizAttempt.quizId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              RefreshIndicator(
                onRefresh: () => _bloc!.fetchQuizById(widget.quizAttempt.quizId),
                child: StreamBuilder<ApiResponse<Quiz>>(
                    stream: _bloc!.quizStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: SpinKitDoubleBounce(color: Colors.lightBlue.shade100),
                            );
                          case Status.COMPLETED:
                            _quiz = snapshot.data!.data;

                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height / 2.5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Colors.deepOrange,
                                        Colors.orangeAccent.shade400,
                                      ],
                                    )),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                        Text(
                                          _quiz.quizTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white, fontSize: 30),
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.translate("Completion Rate").toString() +
                                                  ": ",
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            CircularPercentIndicator(
                                              radius: MediaQuery.of(context).size.width / 8,
                                              lineWidth: MediaQuery.of(context).size.width / 80,
                                              animation: true,
                                              backgroundColor: Colors.white,
                                              percent: widget.quizAttempt.getCompletionRate(),
                                              center: Text(
                                                (widget.quizAttempt.getCompletionRate() * 100).floor().toString() + "%",
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.of(context).size.width / 30,
                                                    color: Colors.white),
                                              ),
                                              circularStrokeCap: CircularStrokeCap.round,
                                              progressColor: Colors.lightBlue,
                                            ),
                                          ],
                                        ),
                                        //SizedBox(height: MediaQuery.of(context).size.height / 10),
                                        Spacer(),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context).size.width / 3,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.timer,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    Text(" " + widget.quizAttempt.duration,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold)),
                                                    Text(
                                                        " " +
                                                            AppLocalizations.of(context)!
                                                                .translate("Times Left")
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ),
                                              const VerticalDivider(
                                                color: Colors.white,
                                                thickness: 1.5,
                                                width: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width / 3,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(widget.quizAttempt.getNumOfQuestionsLeft().toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold)),
                                                    Text(
                                                        " " +
                                                            AppLocalizations.of(context)!
                                                                .translate("Question Left")
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width / 1.2,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(bottom: 10),
                                                    child: Text(
                                                      "Instructions:",
                                                      style: TextStyle(fontSize: 20),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: MediaQuery.of(context).size.height / 3,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.orange,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Html(
                                                      data: _quiz.instructions,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        LoginButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => QuizPage(
                                                    quiz: _quiz,
                                                    isAlreadyStarted: true,
                                                    quizAttempt: widget.quizAttempt.clone(),
                                                  ),
                                                ),
                                              );
                                            },
                                            text: AppLocalizations.of(context)!.translate("Continue").toString()),
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
    );
  }
}
