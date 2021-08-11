import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerDetailsButton extends StatelessWidget {
  final VoidCallback _callback;

  AnswerDetailsButton({
    required VoidCallback onPressed}) : this._callback = onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Next",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17)),
      onPressed: () {showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );},
    );
  }
}
