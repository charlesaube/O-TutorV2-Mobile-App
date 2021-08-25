import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/answer.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/model/shortAnswer.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/question_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/blocs/quiz_attempt_bloc.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/answer_details.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/exit_quiz_dialog.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/multiple_choice.dart';

import 'package:demo3/screens/quiz/quiz_process/widgets/quiz_card.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/score_details.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/short_answer.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/timer_ended_dialog.dart';
import 'package:demo3/screens/quiz_assessment/bloc/self_assessments_bloc.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class SelfAssessmentPage extends StatefulWidget {
  //Quiz en cours
  final SelfAssessment selfAssessment;

  //Liste des questions du quiz en cours
  List<Question> _questions = [];

  SelfAssessmentPage({Key? key, required this.selfAssessment}) : super(key: key) {
    this._questions = this.selfAssessment.questions;
  }

  @override
  _SelfAssessmentState createState() {
    return _SelfAssessmentState();
  }
}

class _SelfAssessmentState extends State<SelfAssessmentPage> {
  SelfAssessmentBloc? _bloc;
  CountDownController _timerController = CountDownController();

  @override
  SelfAssessmentPage get widget => super.widget;

  @override
  void initState() {
    super.initState();
    _bloc = SelfAssessmentBloc();
  }

  void refresh() {
    setState(() {});
  }

  //Réponse de la question en cours
  late String _answer = "";
  late bool _isTrue = false;
  var _questionIndex = 0; //Index de la question en cours

  //Retourne le temps écoulés depuis la derniere question répondu
  int _getElapsedTime() {
    int lastTimeAnswered = Duration(
            minutes: int.parse(widget.selfAssessment.duration.substring(0, 2)),
            seconds: int.parse(widget.selfAssessment.duration.substring(3, 5)))
        .inSeconds;

    int currentTime = Duration(
            minutes: int.parse(_timerController.getTime().substring(0, 2)),
            seconds: int.parse(_timerController.getTime().substring(3, 5)))
        .inSeconds;

    return lastTimeAnswered - currentTime;
  }

  //Méthode pour enregistrer définitivement la réponse de la question en cours
  //et ensuite passer a la prochaine question
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    String type;
    int obtainedMark = 0;
    Question currentQuestion = widget._questions[_questionIndex - 1];

    if (currentQuestion.shortAnswers!.isEmpty) {
      type = "multiplechoice";
    } else {
      type = "shortanswer";
    }
    if (_isTrue) {
      obtainedMark = currentQuestion.weight;
    }
    //Ajout de la réponse a la liste de réponse choisie
    widget.selfAssessment.questionAttempts
        .add(QuestionAttempt(currentQuestion.questionId, 1, obtainedMark, _isTrue, _getElapsedTime(), type, _answer));

    widget.selfAssessment.currentQuestionId = currentQuestion.questionId;
    widget.selfAssessment.duration = _timerController.getTime(); //Mise a jour de la durée restante

    print(widget.selfAssessment);

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
    if (widget._questions[_questionIndex].caseSensitive) {
      //Si la réponse est case sensitive
      shortAnswers.forEach((element) {
        if (element.answer == answer) {
          isTrue = true;
        }
      });
    } else {
      //Si la réponse n'est pas case sensitive
      shortAnswers.forEach((element) {
        if (element.answer!.toLowerCase() == answer.toLowerCase()) {
          isTrue = true;
        }
      });
    }

    return isTrue;
  }

  //Méthod appeler lorsque l'utilisateur souhaite quitter et sauvegarder le quiz
  void saveSelfAssessment() {
    _bloc!.saveSelfAssessments(widget.selfAssessment);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                child: Column(
                  children: [
                    if (_questionIndex < widget._questions.length)
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: [
                                Align(
                                  //Countdown timer

                                  child: CircularCountDownTimer(
                                    duration: Duration(
                                            minutes: int.parse(widget.selfAssessment.duration.substring(0, 2)),
                                            seconds: int.parse(widget.selfAssessment.duration.substring(3, 5)))
                                        .inSeconds,
                                    initialDuration: 0,
                                    controller: _timerController,
                                    width: MediaQuery.of(context).size.width / 10,
                                    height: MediaQuery.of(context).size.height / 10,
                                    ringColor: Colors.transparent,
                                    ringGradient: null,
                                    fillColor: Colors.orange,
                                    fillGradient: null,
                                    backgroundColor: null,
                                    backgroundGradient: null,
                                    strokeWidth: 3.0,
                                    strokeCap: StrokeCap.round,
                                    textStyle: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height / 60,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textFormat: CountdownTextFormat.MM_SS,
                                    isReverse: true,
                                    isReverseAnimation: true,
                                    isTimerTextShown: true,
                                    autoStart: true,
                                    onStart: () {
                                      print('Quiz Started');
                                    },
                                    onComplete: () {
                                      _answerQuestion();
                                      _questionIndex = widget._questions.length + 1;
                                      TimerEndedDialog.showMyDialog(context);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    padding: EdgeInsets.only(top: 40, right: 20),
                                    onPressed: () {
                                      var popupDialog = ExitQuizDialog(context, saveSelfAssessment);
                                      popupDialog.showMyDialog();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
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
                        quizAttempt: widget.selfAssessment.convertToQuizAttempt(),
                      ),
                  ],
                ),
              ),
            ],
          ),
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
