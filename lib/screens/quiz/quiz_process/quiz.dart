import 'package:demo3/model/Answer.dart';
import 'package:demo3/model/question.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/screens/quiz/quiz_process/widgets/quiz_card.dart';
import 'package:demo3/screens/quiz/shapes/bg_circles.dart';
import 'package:demo3/services/Impl/answer_service.dart';
import 'package:demo3/services/Impl/question_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class QuizPage extends StatefulWidget {
  final QuestionService _questionService = new QuestionService();
  final AnswerService _answerService = new AnswerService();

  final Quiz quiz;
  List<Question> _questions = [];

  QuizPage({Key? key, required this.quiz}) : super(key: key) {
    this._questions = _questionService.getQuestionByQuizId(quiz.id);
  }

  @override
  _QuizState createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizPage> {
  @override
  QuizPage get widget => super.widget;

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
    return widget._answerService.getAnswerByQuestionId(id);
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
          Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: 40),
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

                      Container(
                        width: 330,
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: getAnswers(
                                  widget._questions[_questionIndex].questionId)
                              .length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            print(_clicked);
                            _colorContainer = Colors.white;
                            if(index == _clicked)
                              _colorContainer = Colors.lightBlue;

                            return Container(
                              height: 50,
                              margin: EdgeInsets.all(15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: _colorContainer, width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 6,
                                child: InkWell(
                                  splashColor: Colors.lightBlue.withAlpha(50),
                                  onTap: () {
                                    setState(() {
                                      _clicked = index;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        getAnswers(widget
                                                ._questions[_questionIndex]
                                                .questionId)[index]
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
                    ],
                  ),
                ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(90)),

                ),

                margin: EdgeInsets.all(40),
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextButton(
                  child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17)),
                  onPressed: () {
                    _clicked = -1;
                    _answerQuestion();
                  },
                ),
              ),
              Spacer(flex: 3),
              
            ],
          ),
        ],
      ),
    ));
  }
}
