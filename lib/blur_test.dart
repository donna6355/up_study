import 'dart:ui';

import 'package:flutter/material.dart';

class BlurTest extends StatelessWidget {
  const BlurTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLUR TEST'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/bg.gif"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff00C2FF).withOpacity(0.01),
                        Color(0xffffffff).withOpacity(0.01),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Good Morning',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
