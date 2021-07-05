import 'package:demo3/services/Impl/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserService userService = new UserService();
    return Container(
      margin: EdgeInsets.only(top: 50, right: 17, left: 17, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          userService.getUserById(1).firstName,
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
