import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  @override
  ForumState createState() {
    return ForumState();
  }
}

class ForumState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Forums"),
      ),
    );
  }
}
