import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/answer.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/shortAnswer.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/question_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/answer_details.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/exit_quiz_dialog.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/multiple_choice.dart';

import 'package:demo3/screens/quiz/quiz_process/widgets/quiz_card.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/score_details.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/short_answer.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/timer_ended_dialog.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import 'blocs/quiz_attempt_bloc.dart';

class QuizPage extends StatefulWidget {
  //Quiz en cours
  final Quiz quiz;

  late QuizAttempt _quizAttempt;
  //Liste des questions du quiz en cours
  List<Question> _questions = [];

  QuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizState createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizPage> {
  QuizAttemptBloc? _bloc;

  @override
  QuizPage get widget => super.widget;

  @override
  void initState() {
    super.initState();
    _bloc = QuizAttemptBloc();
    _bloc!.createQuizAttempt(widget.quiz.id);
  }

  void refresh() {
    setState(() {
      _bloc!.createQuizAttempt(widget.quiz.id);
    });
  }

  //Réponse de la question en cours
  late String _answer = "";
  late bool _isTrue = false;
  var _questionIndex = 0; //Index de la question en cours

  //Méthode callback pour enregistrer définitivement la réponse de la question en cours
  //et ensuite passer a la prochaine question
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    String type;
    int obtainedMark = 0;
    Question currentQuestion = widget._questions[_questionIndex - 1];

    //Ajout de la réponse a la liste de réponse choisie
    if (currentQuestion.shortAnswers!.isEmpty) {
      type = "multiplechoice";
    } else {
      type = "shortanswer";
    }
    if (_isTrue) {
      obtainedMark = currentQuestion.weight;
    }
    widget._quizAttempt.questionAttempts
        .add(QuestionAttempt(currentQuestion.questionId, 1, obtainedMark, _isTrue, 10, type, _answer));
    widget._quizAttempt.currentQuestionId = currentQuestion.questionId;
    print(widget._quizAttempt);
    _answer = "";
    _isTrue = false;
  }

  //Méthode callback pour set la réponse (ShortAnswer) choisie de la question en cours
  void _setShortAnswer(dynamic newAnswer) {
    setState(() {
      _answer = newAnswer;
      _isTrue = isShortAnswerTrue(_answer);
    });
    print('New Answer for question ' + _questionIndex.toString() + ' was set');
    print('Choosed Answer is: ' + _answer);
  }

  //Méthode callback pour set la réponse (MultipleChoice) choisie de la question en cours
  void _setQuestionAnswer(Answer newAnswer) {
    setState(() {
      _answer = newAnswer.answer;
      _isTrue = newAnswer.isTrue;
    });
    print('New Answer for question ' + _questionIndex.toString() + ' was set');
    print('Choosed Answer is: ' + _answer);
  }

  //permet de verifier si la réponse en input est vrai
  bool isShortAnswerTrue(String answer) {
    List<ShortAnswer> shortAnswers = widget._questions[_questionIndex].shortAnswers!;
    bool isTrue = false;
    shortAnswers.forEach((element) {
      if (element.answer == answer) {
        isTrue = true;
      }
    });
    return isTrue;
  }

  void saveQuizAttempt() {
    _bloc!.saveQuizAttempt(widget._quizAttempt);
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
              child: StreamBuilder<ApiResponse<QuizAttempt>>(
                  stream: _bloc!.quizAttemptStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data!.status) {
                        case Status.LOADING:
                          return Container(
                            child: SpinKitDoubleBounce(color: Colors.lightBlue.shade100),
                          );
                        case Status.COMPLETED:
                          widget._quizAttempt = snapshot.data!.data;
                          widget._questions = snapshot.data!.data.questions;
                          /*if (widget._quizAttempt.currentQuestionId != 0) {
                            //Cherche le bon index de la question si le quiz avait deja commencer.

                            _questionIndex = widget._questions
                                .indexWhere((q) => q.questionId == widget._quizAttempt.currentQuestionId);
                            print("Starting Index set to: " + _questionIndex.toString());
                            _indexIsSet = true;
                          }*/
                          return Column(
                            children: [
                              if (_questionIndex < widget._questions.length)
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.only(top: 40, right: 20),
                                            onPressed: () {
                                              var popupDialog = ExitQuizDialog(context, saveQuizAttempt);
                                              popupDialog.showMyDialog();
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            QuizCard(questions: widget._questions, questionIndex: _questionIndex),
                                            //Affichage varie selon type de question
                                            //Choix de Réponse ------------------------------
                                            if (widget._questions[_questionIndex].multipleAnswers!.isNotEmpty)
                                              MultipleChoice(
                                                  question: widget._questions[_questionIndex],
                                                  setAnswerCallback: _setQuestionAnswer),
                                            //Réponse Courte ------------------------------
                                            if (widget._questions[_questionIndex].shortAnswers!.isNotEmpty)
                                              ShortAnswerWidget(
                                                setAnswerCallback: _setShortAnswer,
                                              ),
                                          ],
                                        ),
                                      ),

                                      Spacer(),
                                      // Bouton suivant
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius: BorderRadius.all(Radius.circular(90)),
                                        ),
                                        margin: EdgeInsets.all(40),
                                        padding: EdgeInsets.only(left: 40, right: 40),
                                        child: AnswerDetailsButton(
                                          onPressed: () {
                                            _answerQuestion();
                                            Navigator.pop(context);
                                          },
                                          answerText: _answer,
                                          isTrue: _isTrue,
                                        ),
                                      ),
                                      Spacer(flex: 3),
                                    ],
                                  ),
                                ),
                              if (_questionIndex >= widget._questions.length)
                                ScoreDetails(
                                  quizAttempt: widget._quizAttempt,
                                ),
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
            if (_questionIndex < widget._questions.length || _questionIndex == 0)
              Align(
                //Countdown timer
                child: CircularCountDownTimer(
                  duration: Duration(
                          minutes: 5 /*int.parse(widget._quizAttempt.duration.substring(0, 2))*/,
                          seconds: 2 /*int.parse(widget._quizAttempt.duration.substring(3, 5))*/)
                      .inSeconds,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 6,
                  ringColor: Colors.transparent,
                  ringGradient: null,
                  fillColor: Colors.orange,
                  fillGradient: null,
                  backgroundColor: null,
                  backgroundGradient: null,
                  strokeWidth: 3.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    TimerEndedDialog.showMyDialog(context);
                  },
                ),
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
