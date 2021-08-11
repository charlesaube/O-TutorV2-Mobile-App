import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/answer.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/question_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/answerDetails.dart';

import 'package:demo3/screens/quiz/quiz_process/widgets/quiz_card.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;
  List<Question> _questions = [];

  QuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizState createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizPage> {
  QuestionBloc? _bloc;

  @override
  QuizPage get widget => super.widget;

  @override
  void initState() {
    super.initState();
    _bloc = QuestionBloc(widget.quiz.id);
  }

  void refresh() {
    setState(() {
      _bloc!.fetchQuestionByQuizId(widget.quiz.id);
    });
  }

  var _questionIndex = 0;
  Color _colorContainer = Colors.blue;
  int _clicked = -1;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < widget._questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  List<Answer> getAnswers(int id) {
    throw UnimplementedError();
    // return widget._answerService.fetchAnswerByQuestionId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<ApiResponse<List<Question>>>(
                  stream: _bloc!.questionListStream,
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
                          widget._questions = snapshot.data!.data;
                          return Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.only(top: 40, left: 20),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              if (_questionIndex < widget._questions.length)
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      QuizCard(
                                          questions: widget._questions,
                                          questionIndex: _questionIndex),

                                      //Choix de Réponse ------------------------------
                                      if (widget._questions[_questionIndex]
                                          .multipleAnswers!.isNotEmpty)
                                        Container(
                                          width: 330,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: widget
                                                ._questions[_questionIndex]
                                                .multipleAnswers!
                                                .length,
                                            itemBuilder: (
                                              BuildContext context,
                                              int index,
                                            ) {
                                              //Change la couleur du container Clické ------------------------
                                              print(_clicked);
                                              _colorContainer =
                                                  Colors.grey.shade200;
                                              if (index == _clicked)
                                                _colorContainer =
                                                    Colors.lightBlue;

                                              return Container(
                                                height: 50,
                                                margin: EdgeInsets.all(15),
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: _colorContainer,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  elevation: 6,
                                                  child: InkWell(
                                                    splashColor: Colors
                                                        .lightBlue
                                                        .withAlpha(50),
                                                    onTap: () {
                                                      setState(() {
                                                        _clicked = index;
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          widget
                                                              ._questions[
                                                                  _questionIndex]
                                                              .multipleAnswers![
                                                                  index]
                                                              .answer,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (widget._questions[_questionIndex]
                                          .shortAnswers!.isNotEmpty)
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          width: 330,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          alignment: Alignment.center,
                                          child: TextFormField(
                                            decoration: new InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange,
                                                    width: 2.0),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange,
                                                    width: 2.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),

                              Spacer(),

                              // Bouton suivant
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90)),
                                ),
                                margin: EdgeInsets.all(40),
                                padding: EdgeInsets.only(left: 40, right: 40),
                                child: AnswerDetailsButton(onPressed: () {  },)

                              ),
                              Spacer(flex: 3),
                            ],
                          );
                          break;

                        case Status.ERROR:
                          return ErrorPopUp(snapshot, refresh);
                          break;
                      }
                    }
                    return Text("No data");
                  }),
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
