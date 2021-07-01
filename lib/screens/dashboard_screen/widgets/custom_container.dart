import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget _child;

  CustomContainer(this._child);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/6,

      decoration: BoxDecoration(
          color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: _child,

    );
  }
}