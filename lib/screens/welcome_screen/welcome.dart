import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'widgets/buttons.dart';
import 'login.dart';

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
                                builder: (context) => LoginPage()),
                          );
                        }),
                    SignupButton(),
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

class AbstractShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 0.55, size.height * 0.50),
        [Color(0xffff5050), Color(0xffffad40)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.cubicTo(
        size.width * 0.0402800,
        size.height * 0.4487500,
        size.width * 0.2690600,
        size.height * 0.2550500,
        size.width * 0.3820000,
        size.height * 0.3556500);
    path_0.cubicTo(
        size.width * 0.5690000,
        size.height * 0.4970500,
        size.width * 0.6430000,
        size.height * -0.0079000,
        size.width * 0.8012600,
        0);
    path_0.quadraticBezierTo(
        size.width * 0.7015000, size.height * -0.0183500, 0, 0);
    path_0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AbstractShape2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final degrees = 180;
    final radians = degrees * math.pi / 180;

    canvas.rotate(radians);

    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.50),
        Offset(size.width * 0.55, size.height * 0.50),
        [Color(0xffff5050), Color(0xffffad40)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.cubicTo(
        size.width * 0.0402800,
        size.height * 0.4487500,
        size.width * 0.2690600,
        size.height * 0.2550500,
        size.width * 0.3820000,
        size.height * 0.3556500);
    path_0.cubicTo(
        size.width * 0.5690000,
        size.height * 0.4970500,
        size.width * 0.6430000,
        size.height * -0.0079000,
        size.width * 0.8012600,
        0);
    path_0.quadraticBezierTo(
        size.width * 0.7015000, size.height * -0.0183500, 0, 0);
    path_0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
