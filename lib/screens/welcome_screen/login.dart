import 'package:demo3/custom_painter/corner_wave.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/college.dart';
import 'package:demo3/screens/welcome_screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'widgets/form.dart';

class LoginPage extends StatefulWidget {
  final String collegeName;

  LoginPage({
    Key? key,
    required this.collegeName,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(700, (700 * 0.3).toDouble()),
              painter: AbstractShapePainterFlip(),
            ),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.93,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logoGrey.png',
                          height: 150,
                          width: 250,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            AppLocalizations.of(context)!.translate("College").toString() + widget.collegeName,
                            style:
                                TextStyle(fontSize: 16, color: Colors.orange),
                          ),
                        ),
                        Container(
                          child: LoginForm(),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(AppLocalizations.of(context)!
                          .translate("Don't have an account")
                          .toString()),
                      new InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: new Text(
                              AppLocalizations.of(context)!
                                      .translate("Sign up")
                                      .toString() +
                                  " !",
                              style: TextStyle(color: Colors.deepOrangeAccent),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
