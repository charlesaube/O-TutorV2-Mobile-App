import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:30, right: 17, left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hi Maxim!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text("Photo"),
        ],
      ),
    );
  }
}
