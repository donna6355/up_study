import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgress extends CustomPainter {
  final double value;

  CustomCircularProgress({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCenter(center: center, width: 170, height: 170),
      3 * math.pi / 4,
      6 * math.pi / 4,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black12
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 20,
    );
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: 200, height: 200),
      Paint(),
    );

    const Gradient gradient = SweepGradient(
      colors: <Color>[
        Color.fromARGB(255, 142, 215, 248),
        Color.fromARGB(255, 5, 91, 240),
      ],
      transform: GradientRotation(math.pi / 2),
    );
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 170, height: 170),
      3 * math.pi / 4,
      value * 6 * math.pi / 4,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..shader = gradient
            .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
        ..strokeWidth = 20,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
