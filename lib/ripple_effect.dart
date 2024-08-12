import 'package:flutter/material.dart';

class RippleEffect extends StatefulWidget {
  const RippleEffect({super.key});

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      lowerBound: 0.3,
      upperBound: 1.0,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Made Ripple Effect"),
      ),
      body: AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return CustomPaint(
            size: const Size(600, 600),
            painter: CustomCircle(_controller.value),
          );
        },
      ),
    );
  }
}

class CustomCircle extends CustomPainter {
  final double val;
  CustomCircle(
    this.val,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // print('size : ${size.width} , ${size.height}');
    Paint paint = Paint()..color = Color(0xd08FA8FF).withOpacity(1 - val);
    canvas
      ..drawCircle(Offset(size.width / 2, size.height / 2), 300 * val, paint)
      ..drawCircle(Offset(size.width / 2, size.height / 2), 400 * val, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
