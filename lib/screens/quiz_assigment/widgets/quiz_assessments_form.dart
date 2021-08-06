import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orange_slider_container.dart';

class QuizAssessmentsForm extends StatefulWidget {
  @override
  _QuizAssessmentsState createState() => _QuizAssessmentsState();
}

class _QuizAssessmentsState extends State<QuizAssessmentsForm> {
  String dropdownValue = 'One';
  double _currentSliderValue = 100;
  Map<String, bool> List = {
    'Egges': false,
    'Chocolates': false,
    'Flour': false,
    'Fllower': false,
    'Fruits': false,
  };

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
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!.translate('Choose your course').toString() + ": "),
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
                        items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Text(AppLocalizations.of(context)!.translate('Choose your subject').toString() + ": "),
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
                      children: List.keys.map((String key) {
                        return new CheckboxListTile(
                          title: new Text(key),
                          value: List[key],
                          activeColor: Colors.orange,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              List[key] = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  OrangeSliderContainer(
                    currentSliderValue: _currentSliderValue,
                    min: 0,
                    max: 100,
                    division: 100,
                    text: "Time",
                  ),
                  OrangeSliderContainer(
                      currentSliderValue: _currentSliderValue,
                      min: 0,
                      max: 100,
                      division: 100,
                      text: "Nb of questions"),
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
