import 'package:flutter/material.dart';

import 'custom_guage.dart';

class ChartTest extends StatelessWidget {
  const ChartTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart and Guage Test'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 0.75),
          duration: const Duration(seconds: 2),
          curve: Curves.bounceOut,
          builder: (_, num, __) {
            return CustomPaint(painter: CustomCircularProgress(value: num));
          },
        ),
      ),
    );
  }
}
