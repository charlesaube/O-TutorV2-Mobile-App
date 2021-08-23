import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/screens/dashboard_screen/widgets/header.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc/self_assessments_bloc.dart';
import 'self_assessment_process/self_assessment.dart';
import 'widgets/quiz_assessments_form.dart';

class CreateSelfAssessmentsPage extends StatefulWidget {
  @override
  _CreateSelfAssessmentsState createState() {
    return _CreateSelfAssessmentsState();
  }
}

class _CreateSelfAssessmentsState extends State<CreateSelfAssessmentsPage> {
  double _currentSliderValue = 0;

  SelfAssessmentBloc? _bloc;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _bloc = SelfAssessmentBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                    LoginButton(
                        onPressed: () async {
                          var result = await _bloc!.createSelfAssessments(1, [3, 54, 6], "10:00", 3);
                          // _bloc!.createSelfAssessments(1, [3, 54, 6], "10:00", 3);
                          // SelfAssessment? sa;
                          // _bloc!.selfAssessmentStream.listen((value) async {
                          //   sa = await value.data;
                          // });
                        },
                        text: AppLocalizations.of(context)!.translate("Start").toString()),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
