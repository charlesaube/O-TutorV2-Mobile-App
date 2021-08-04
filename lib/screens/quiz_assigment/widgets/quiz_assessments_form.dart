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
              child: Column(
                children: <Widget>[
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
