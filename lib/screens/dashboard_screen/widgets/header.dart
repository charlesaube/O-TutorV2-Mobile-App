import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, right: 17, left: 17, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Hi Maxime!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/pdp.jpg',
            height: 50,
            width: 50,
            fit: BoxFit.fill,
          ),
        ),
      ]),
    );
  }
}
