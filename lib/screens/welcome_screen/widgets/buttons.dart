import 'package:demo3/add_on/outline_button.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../signup.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _callback;
  final String _text;

  LoginButton({
    required VoidCallback onPressed,
    required String text
  }) : this._callback = onPressed, this._text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      onPressed: _callback,
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.1, 0.8, 0.9],
              colors: [Color(0xffff5050), Colors.orange, Colors.orangeAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            _text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }
}

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UnicornOutlineButton(
        strokeWidth: 2,
        radius: 24,
        gradient: LinearGradient(
            colors: [Color(0xffff5050), Colors.orange, Colors.orangeAccent]),
        child: Text(AppLocalizations.of(context)!.translate('Sign up').toString(), style: TextStyle(fontSize: 13)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
      ),
    );
  }
}
