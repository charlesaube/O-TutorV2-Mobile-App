import 'package:demo3/screens/welcome_screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'widgets/form.dart';
import 'dart:math' as math;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                size: Size(700, (700 * 0.3).toDouble()),
                painter: AbstractShapePainter(),
              ),
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
                          child: SignupForm(),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Already Have an Account? "),
                      new InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: new Text(
                              "Login!",
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
    path_0.moveTo(size.width * 1.0030000, 0);
    path_0.lineTo(size.width * 1.0030000, size.height);
    path_0.quadraticBezierTo(size.width * 0.9305000, size.height * 0.4412500,
        size.width * 0.7950000, size.height * 0.4575000);
    path_0.cubicTo(
        size.width * 0.6577600,
        size.height * 0.5462500,
        size.width * 0.6385000,
        size.height * 0.0431500,
        size.width * 0.3720000,
        size.height * 0.2950000);
    path_0.quadraticBezierTo(size.width * 0.2375000, size.height * 0.3956500,
        size.width * 0.0030000, 0);
    path_0.lineTo(size.width * 1.0030000, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
