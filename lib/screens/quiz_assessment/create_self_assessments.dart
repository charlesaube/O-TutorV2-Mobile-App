import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/topic.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/quiz_assessment/bloc/self_assessment_form_bloc.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:demo3/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  SelfAssessmentBloc? _selfAssessmentBloc;
  SelfAssessmentFormBloc? _topicBloc;
  late Map<Topic, bool> _selectedTopics;
  late List<int> topicsId = [];
  late String time;
  late int nbQuestion;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _selfAssessmentBloc = SelfAssessmentBloc();
    _topicBloc = SelfAssessmentFormBloc();
    _topicBloc!.getTopicsByGroupId(23);
  }

  @override
  void dispose() {
    super.dispose();
    _selfAssessmentBloc!.dispose();
    _topicBloc!.dispose();
  }

  void refresh() {
    setState(() {
      _topicBloc!.getTopicsByGroupId(23);
    });
  }

  //Méthode callback utiliser dans le form pour mettre a jour la liste de topics selon le cours choisi
  void updateTopicsList(int groupId) {
    setState(() {
      _topicBloc!.getTopicsByGroupId(groupId);
    });
  }

  void _setFormValue(Map<Topic, bool> map, int time, int nbQuestion) {
    this.time = "$time:00";
    _selectedTopics = map;
    this.nbQuestion = nbQuestion;
    print("time");
    print(nbQuestion);
  }

  List<int> fetchTopicsId(Map<Topic, bool> topicsMap) {
    topicsMap.removeWhere((key, value) => !value);
    topicsMap.forEach((k, v) => topicsId.add(k.id));
    return topicsId;
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
          child: StreamBuilder<ApiResponse<List<Topic>>>(
              stream: _topicBloc!.topicsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return SpinKitDoubleBounce(color: Colors.amber);
                      break;
                    case Status.COMPLETED:
                      return Stack(
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
                                      QuizAssessmentsForm(
                                          groupList: SecureStorage.getUserGroupsList(),
                                          topics: snapshot.data!.data,
                                          selectedCourseChangedCallback: updateTopicsList,
                                          selectedTopicsCallback: _setFormValue),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                LoginButton(
                                    onPressed: () async {
                                      _selfAssessmentBloc = SelfAssessmentBloc();
                                      var result = await _selfAssessmentBloc!
                                          .createSelfAssessments(1, fetchTopicsId(_selectedTopics), time, nbQuestion);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SelfAssessmentPage(
                                                  selfAssessment: result,
                                                )),
                                      );
                                    },
                                    text: AppLocalizations.of(context)!.translate("Start").toString()),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      );

                    case Status.ERROR:
                      return ErrorPopUp(snapshot, refresh);
                  }
                }
                return Container(child: Text("No data"));
              }),
        ),
      ),
    );
  }
}
