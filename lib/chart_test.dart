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
        child: CustomPaint(painter: CustomCircularProgress(value: 0.7)),
      ),
    );
  }
}
