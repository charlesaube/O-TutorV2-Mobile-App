import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseCategoryPage extends StatefulWidget {

  @override
  _BrowseCategoryState createState() {
    return _BrowseCategoryState();
  }


}

class _BrowseCategoryState extends State<BrowseCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Quiz"),
      ),
    );
  }
}

