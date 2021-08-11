import 'package:demo3/model/answer.dart';
import 'package:flutter/material.dart';

typedef void VoidCallback(String newAnswer);

class ShortAnswer extends StatefulWidget {
  final VoidCallback setAnswerCallback;
  ShortAnswer({Key? key, required this.setAnswerCallback}) : super(key: key);

  @override
  _ShortAnswerState createState() => _ShortAnswerState();
}

class _ShortAnswerState extends State<ShortAnswer> {
  String shortAnswerText = " ";

  final answerTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    answerTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 330,
      height: MediaQuery.of(context).size.width / 1.5,
      alignment: Alignment.center,
      child: TextFormField(
        controller: answerTextController,
        decoration: new InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 2.0),
          ),
        ),
        onEditingComplete: () {
          this.widget.setAnswerCallback(answerTextController.text);
        },
      ),
    );
  }
}