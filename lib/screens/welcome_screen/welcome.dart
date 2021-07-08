import 'package:demo3/custom_painter/corner_wave.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'colleges.dart';
import 'widgets/buttons.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(500, (500 * 0.4).toDouble()),
            painter: AbstractShapePainter(),
          ),
          Positioned(
            bottom: -150,
            right: -400,
            height: 150,
            width: 400,
            child: CustomPaint(
              size: Size(500, (600 * 0.5).toDouble()),
              painter: AbstractShape2Painter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Image.asset('assets/logoGrey.png',
                          height: 150, width: 250),
                    ),
                    LoginButton(
                        text:  AppLocalizations.of(context)!.translate('Login').toString(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Colleges()),
                          );
                        }),
                    // SignupButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


