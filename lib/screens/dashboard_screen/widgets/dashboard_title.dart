import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTitle extends StatelessWidget {
  final String _text;

  DashboardTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Text(
          _text,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}
