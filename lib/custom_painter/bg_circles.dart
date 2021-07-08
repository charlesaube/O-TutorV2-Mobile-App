import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path_0 = Path();

    canvas.drawPath(path_0, paint_0);


    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_1 = Path();
    path_1.moveTo(size.width*1.0008000,size.height*-0.1853200);
    path_1.cubicTo(size.width*1.1649333,size.height*-0.1853200,size.width*1.4114333,size.height*-0.1162200,size.width*1.4114333,size.height*0.0612400);
    path_1.cubicTo(size.width*1.4114333,size.height*0.1598200,size.width*1.2880667,size.height*0.3076600,size.width*1.0008000,size.height*0.3076600);
    path_1.cubicTo(size.width*0.8362000,size.height*0.3076600,size.width*0.5902000,size.height*0.2337800,size.width*0.5902000,size.height*0.0612400);
    path_1.cubicTo(size.width*0.5902000,size.height*-0.0373000,size.width*0.7133667,size.height*-0.1853200,size.width*1.0008000,size.height*-0.1853200);
    path_1.close();

    canvas.drawPath(path_1, paint_1);


    Paint paint_2 = new Paint()
      ..color = Color.fromARGB(255, 41, 195, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_2 = Path();
    path_2.moveTo(size.width*0.4777000,size.height*0.5616000);
    path_2.cubicTo(size.width*0.8510000,size.height*0.5616000,size.width*1.4118000,size.height*0.7183600,size.width*1.4118000,size.height*1.1213400);
    path_2.cubicTo(size.width*1.4118000,size.height*1.3467200,size.width*1.1318000,size.height*1.6811000,size.width*0.4777000,size.height*1.6811000);
    path_2.cubicTo(size.width*0.1037667,size.height*1.6811000,size.width*-0.4563000,size.height*1.5130800,size.width*-0.4563000,size.height*1.1213400);
    path_2.cubicTo(size.width*-0.4563000,size.height*0.8963600,size.width*-0.1768667,size.height*0.5616000,size.width*0.4777000,size.height*0.5616000);
    path_2.close();

    canvas.drawPath(path_2, paint_2);


    Paint paint_3 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_3 = Path();
    path_3.moveTo(size.width*-0.1922333,size.height*0.4710800);
    path_3.cubicTo(size.width*-0.0272333,size.height*0.4710800,size.width*0.2197667,size.height*0.5419000,size.width*0.2197667,size.height*0.7183800);
    path_3.cubicTo(size.width*0.2197667,size.height*0.8170400,size.width*0.0970333,size.height*0.9655600,size.width*-0.1922333,size.height*0.9655600);
    path_3.cubicTo(size.width*-0.3573000,size.height*0.9655600,size.width*-0.6043000,size.height*0.8918800,size.width*-0.6043000,size.height*0.7183800);
    path_3.cubicTo(size.width*-0.6043000,size.height*0.6196000,size.width*-0.4818333,size.height*0.4710800,size.width*-0.1922333,size.height*0.4710800);
    path_3.close();

    canvas.drawPath(path_3, paint_3);


    Paint paint_4 = new Paint()
      ..color = Color.fromARGB(255, 44, 207, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_4 = Path();
    path_4.moveTo(size.width*0.0959667,size.height*0.0943200);
    path_4.cubicTo(size.width*0.1756000,size.height*0.0943200,size.width*0.2951333,size.height*0.1278200,size.width*0.2951333,size.height*0.2139200);
    path_4.cubicTo(size.width*0.2951333,size.height*0.2617600,size.width*0.2354000,size.height*0.3334800,size.width*0.0959667,size.height*0.3334800);
    path_4.cubicTo(size.width*0.0163000,size.height*0.3334800,size.width*-0.1032333,size.height*0.2976400,size.width*-0.1032333,size.height*0.2139200);
    path_4.cubicTo(size.width*-0.1032333,size.height*0.1661400,size.width*-0.0435000,size.height*0.0943200,size.width*0.0959667,size.height*0.0943200);
    path_4.close();

    canvas.drawPath(path_4, paint_4);


    Paint paint_5 = new Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_5 = Path();
    path_5.moveTo(size.width*0.9663667,size.height*0.7208200);
    path_5.cubicTo(size.width*0.9970000,size.height*0.7208200,size.width*1.0429667,size.height*0.7337000,size.width*1.0429667,size.height*0.7667800);
    path_5.cubicTo(size.width*1.0429667,size.height*0.7851800,size.width*1.0199667,size.height*0.8127600,size.width*0.9663667,size.height*0.8127600);
    path_5.cubicTo(size.width*0.9357000,size.height*0.8127600,size.width*0.8897333,size.height*0.7989600,size.width*0.8897333,size.height*0.7667800);
    path_5.cubicTo(size.width*0.8897333,size.height*0.7484000,size.width*0.9127333,size.height*0.7208200,size.width*0.9663667,size.height*0.7208200);
    path_5.close();

    canvas.drawPath(path_5, paint_5);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class RPSCustomPainter180 extends CustomPainter{




  @override
  void paint(Canvas canvas, Size size) {


    final degrees = 180;
    final radians = degrees * math.pi / 180;

    canvas.rotate(radians);

    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path_0 = Path();

    canvas.drawPath(path_0, paint_0);


    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_1 = Path();
    path_1.moveTo(size.width*1.0008000,size.height*-0.1853200);
    path_1.cubicTo(size.width*1.1649333,size.height*-0.1853200,size.width*1.4114333,size.height*-0.1162200,size.width*1.4114333,size.height*0.0612400);
    path_1.cubicTo(size.width*1.4114333,size.height*0.1598200,size.width*1.2880667,size.height*0.3076600,size.width*1.0008000,size.height*0.3076600);
    path_1.cubicTo(size.width*0.8362000,size.height*0.3076600,size.width*0.5902000,size.height*0.2337800,size.width*0.5902000,size.height*0.0612400);
    path_1.cubicTo(size.width*0.5902000,size.height*-0.0373000,size.width*0.7133667,size.height*-0.1853200,size.width*1.0008000,size.height*-0.1853200);
    path_1.close();

    canvas.drawPath(path_1, paint_1);


    Paint paint_2 = new Paint()
      ..color = Color.fromARGB(255, 41, 195, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path_2 = Path();
    path_2.moveTo(size.width*0.4777000,size.height*0.5616000);
    path_2.cubicTo(size.width*0.8510000,size.height*0.5616000,size.width*1.4118000,size.height*0.7183600,size.width*1.4118000,size.height*1.1213400);
    path_2.cubicTo(size.width*1.4118000,size.height*1.3467200,size.width*1.1318000,size.height*1.6811000,size.width*0.4777000,size.height*1.6811000);
    path_2.cubicTo(size.width*0.1037667,size.height*1.6811000,size.width*-0.4563000,size.height*1.5130800,size.width*-0.4563000,size.height*1.1213400);
    path_2.cubicTo(size.width*-0.4563000,size.height*0.8963600,size.width*-0.1768667,size.height*0.5616000,size.width*0.4777000,size.height*0.5616000);
    path_2.close();

    canvas.drawPath(path_2, paint_2);


    Paint paint_3 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_3 = Path();
    path_3.moveTo(size.width*-0.1922333,size.height*0.4710800);
    path_3.cubicTo(size.width*-0.0272333,size.height*0.4710800,size.width*0.2197667,size.height*0.5419000,size.width*0.2197667,size.height*0.7183800);
    path_3.cubicTo(size.width*0.2197667,size.height*0.8170400,size.width*0.0970333,size.height*0.9655600,size.width*-0.1922333,size.height*0.9655600);
    path_3.cubicTo(size.width*-0.3573000,size.height*0.9655600,size.width*-0.6043000,size.height*0.8918800,size.width*-0.6043000,size.height*0.7183800);
    path_3.cubicTo(size.width*-0.6043000,size.height*0.6196000,size.width*-0.4818333,size.height*0.4710800,size.width*-0.1922333,size.height*0.4710800);
    path_3.close();

    canvas.drawPath(path_3, paint_3);


    Paint paint_4 = new Paint()
      ..color = Color.fromARGB(255, 44, 207, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_4 = Path();
    path_4.moveTo(size.width*0.0959667,size.height*0.0943200);
    path_4.cubicTo(size.width*0.1756000,size.height*0.0943200,size.width*0.2951333,size.height*0.1278200,size.width*0.2951333,size.height*0.2139200);
    path_4.cubicTo(size.width*0.2951333,size.height*0.2617600,size.width*0.2354000,size.height*0.3334800,size.width*0.0959667,size.height*0.3334800);
    path_4.cubicTo(size.width*0.0163000,size.height*0.3334800,size.width*-0.1032333,size.height*0.2976400,size.width*-0.1032333,size.height*0.2139200);
    path_4.cubicTo(size.width*-0.1032333,size.height*0.1661400,size.width*-0.0435000,size.height*0.0943200,size.width*0.0959667,size.height*0.0943200);
    path_4.close();

    canvas.drawPath(path_4, paint_4);


    Paint paint_5 = new Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path_5 = Path();
    path_5.moveTo(size.width*0.9663667,size.height*0.7208200);
    path_5.cubicTo(size.width*0.9970000,size.height*0.7208200,size.width*1.0429667,size.height*0.7337000,size.width*1.0429667,size.height*0.7667800);
    path_5.cubicTo(size.width*1.0429667,size.height*0.7851800,size.width*1.0199667,size.height*0.8127600,size.width*0.9663667,size.height*0.8127600);
    path_5.cubicTo(size.width*0.9357000,size.height*0.8127600,size.width*0.8897333,size.height*0.7989600,size.width*0.8897333,size.height*0.7667800);
    path_5.cubicTo(size.width*0.8897333,size.height*0.7484000,size.width*0.9127333,size.height*0.7208200,size.width*0.9663667,size.height*0.7208200);
    path_5.close();

    canvas.drawPath(path_5, paint_5);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}






