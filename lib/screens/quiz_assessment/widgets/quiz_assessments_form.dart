import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orange_slider_container.dart';

typedef void VoidCallback(Map<Topic, bool> map, int time, int nbQuestion);
typedef ChangedGroupCallback = Function(int groupId);

class QuizAssessmentsForm extends StatefulWidget {
  List<Group> groupList;
  List<Topic> topics;
  late Map<Topic, bool> topicsMap;
  final ChangedGroupCallback selectedCourseChangedCallback;
  final VoidCallback selectedTopicsCallback;

  QuizAssessmentsForm(
      {Key? key,
      required this.groupList,
      required this.topics,
      required this.selectedCourseChangedCallback,
      required this.selectedTopicsCallback})
      : super(key: key) {
    this.topicsMap = {for (var item in topics) item: false};
    if (this.groupList.length <= 1) {
      //Group hardcoder pour tester
      this.groupList.add(Group(23, "Group 2", "21", "Bobi Joh", "23124", "Programmation orientée object 1", "status",
          "addedBy", "isAdmin", "created", "modified", "image", "courseName", 1, 1, 3, 1, 1, 1, 0, 0, 0));
    }
  }

  @override
  _QuizAssessmentsState createState() => _QuizAssessmentsState();
}

class _QuizAssessmentsState extends State<QuizAssessmentsForm> {
  @override
  QuizAssessmentsForm get widget => super.widget;

  late int dropdownValue;
  double _currentTimeSliderValue = 1;
  double _currentNbQuestionSliderValue = 1;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.groupList.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.translate('Choose your course').toString() + ": ",
                          style: TextStyle(fontSize: 15)),
                      Expanded(
                        child: DropdownButton<int>(
                          value: dropdownValue,
                          isExpanded: true,
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepOrange),
                          underline: Container(
                            height: 2,
                            color: Colors.orangeAccent,
                          ),
                          onChanged: (int? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              widget.selectedCourseChangedCallback(dropdownValue);
                            });
                          },
                          items: widget.groupList.map<DropdownMenuItem<int>>((Group group) {
                            return DropdownMenuItem<int>(
                              value: group.id,
                              child: Text(
                                group.description,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Text(AppLocalizations.of(context)!.translate('Choose your subject').toString() + ": ",
                      style: TextStyle(fontSize: 15)),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orangeAccent, width: 3),
                    ),
                    child: GridView(
                      padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1, childAspectRatio: 10 / 3),
                      physics: BouncingScrollPhysics(),
                      children: widget.topicsMap.keys.map((Topic key) {
                        return new CheckboxListTile(
                          title: new Text(key.title),
                          value: widget.topicsMap[key],
                          activeColor: Colors.orange,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.topicsMap[key] = value!;
                              widget.selectedTopicsCallback(widget.topicsMap, _currentTimeSliderValue.floor(),
                                  _currentNbQuestionSliderValue.floor());
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  OrangeSliderContainer(
                    currentSliderValue: _currentTimeSliderValue,
                    min: 1,
                    max: 60,
                    division: 60,
                    text: AppLocalizations.of(context)!.translate('Time').toString(),
                    onChangedCallback: (double value) {
                      setState(() {
                        _currentTimeSliderValue = value;
                        widget.selectedTopicsCallback(
                            widget.topicsMap, _currentTimeSliderValue.floor(), _currentNbQuestionSliderValue.floor());
                      });
                    },
                  ),
                  OrangeSliderContainer(
                    currentSliderValue: _currentNbQuestionSliderValue,
                    min: 1,
                    max: 100,
                    division: 100,
                    text: AppLocalizations.of(context)!.translate('Number of Questions').toString(),
                    onChangedCallback: (double value) {
                      setState(() {
                        _currentNbQuestionSliderValue = value;
                        widget.selectedTopicsCallback(
                            widget.topicsMap, _currentTimeSliderValue.floor(), _currentNbQuestionSliderValue.floor());
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
