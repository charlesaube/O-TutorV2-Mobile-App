import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orange_slider_container.dart';

class QuizAssessmentsForm extends StatefulWidget {
  List<Topic> topics;
  late Map<Topic, bool> topicsMap;

  QuizAssessmentsForm({required List<Topic> topics}) : this.topics = topics {
    this.topicsMap = {for (var item in topics) item: false};
  }

  @override
  _QuizAssessmentsState createState() => _QuizAssessmentsState();
}

class _QuizAssessmentsState extends State<QuizAssessmentsForm> {
  @override
  QuizAssessmentsForm get widget => super.widget;

  String dropdownValue = 'One';
  double _currentSliderValue = 1;
  Map<String, bool> List = {
    'Enum': false,
    'Variable': false,
    'Class': false,
    'Polymophisme': false,
    'Test unitaire': false,
  };

  @override
  void initState() {
    super.initState();
    print(widget.topicsMap);
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
                      DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepOrange),
                        underline: Container(
                          height: 2,
                          color: Colors.orangeAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items:
                            <String>['One', 'Two', 'Free', 'Algorithme'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  OrangeSliderContainer(
                    currentSliderValue: _currentSliderValue,
                    min: 1,
                    max: 60,
                    division: 60,
                    text: AppLocalizations.of(context)!.translate('Time').toString(),
                  ),
                  OrangeSliderContainer(
                      currentSliderValue: _currentSliderValue,
                      min: 1,
                      max: 100,
                      division: 100,
                      text: AppLocalizations.of(context)!.translate('Number of Questions').toString()),
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
