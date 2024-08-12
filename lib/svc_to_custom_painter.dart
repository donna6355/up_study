import 'package:flutter/material.dart';

class SvgToCustom extends StatelessWidget {
  const SvgToCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SVG to Custom Painter"),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(183, 220),
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}

//https://fluttershapemaker.com/#/
//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(179, 16);
    path_1.cubicTo(179, 7.16344, 171.837, 0, 163, 0);
    path_1.lineTo(24.8878, 0);
    path_1.cubicTo(18.9473, 0, 13.4958, 3.29123, 10.7291, 8.54805);
    path_1.lineTo(5.84131, 17.8348);
    path_1.cubicTo(4.63196, 20.1326, 4, 22.6902, 4, 25.2868);
    path_1.lineTo(4, 189.498);
    path_1.cubicTo(4, 192.442, 4.8123, 195.329, 6.34749, 197.841);
    path_1.lineTo(10.3208, 204.343);
    path_1.cubicTo(13.2273, 209.099, 18.3995, 212, 23.9734, 212);
    path_1.lineTo(163, 212);
    path_1.cubicTo(171.837, 212, 179, 204.837, 179, 196);
    path_1.lineTo(179, 16);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff191F3A).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
