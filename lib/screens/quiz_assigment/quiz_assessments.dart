import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/dashboard_screen/widgets/header.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz_assigment/widgets/quiz_assessments_form.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizAssessmentsPage extends StatefulWidget {
  @override
  QuizAssessmentState createState() {
    return QuizAssessmentState();
  }
}

class QuizAssessmentState extends State<QuizAssessmentsPage> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate("Exercise").toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[700],
      ),
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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        //HeaderCategory("Exercise", "Exercise"),
                        SizedBox(height: 20),
                        QuizAssessmentsForm(),
                      ],
                    ),
                  ),
                  Spacer(),
                  LoginButton(onPressed: () {}, text: AppLocalizations.of(context)!.translate("Start").toString()),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
