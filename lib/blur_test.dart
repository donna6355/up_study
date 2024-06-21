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
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset("assets/bg.gif"),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: BackdropFilter(
                          blendMode: BlendMode.saturation,
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff00C2FF).withOpacity(0.25),
                                  Color(0xffffffff).withOpacity(0.18),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: BackdropFilter(
                          blendMode: BlendMode.saturation,
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff00C2FF).withOpacity(0.25),
                                  Color(0xffffffff).withOpacity(0.18),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: BackdropFilter(
                          blendMode: BlendMode.saturation,
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff00C2FF).withOpacity(0.25),
                                  Color(0xffffffff).withOpacity(0.18),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 100)
            ],
          )
        ],
      ),
    );
  }
}
/**
 * 
 * <div style="width: 100%; height: 100%; justify-content: center; align-items: center; display: inline-flex">
    <div style="width: 240px; height: 40px; padding-left: 8px; padding-right: 8px; padding-top: 4px; padding-bottom: 4px; 
    background: linear-gradient(0deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.18) 100%), linear-gradient(0deg, rgba(0, 193.80, 255, 0.25) 0%, rgba(0, 193.80, 255, 0.25) 100%), linear-gradient(0deg,  0%,  100%); border-radius: 28px; border: 1.40px white solid; backdrop-filter: blur(68px); justify-content: center; align-items: center; gap: 6px; display: inline-flex">
        <div style="width: 18px; height: 18px; position: relative">
            <div style="width: 18px; height: 16.63px; left: 0px; top: 0.75px; position: absolute; background: #F7F7F7"></div>
        </div>
        <div style="text-align: center; color: #F7F7F7; font-size: 14px; font-family: Pretendard; font-weight: 700; line-height: 24px; word-wrap: break-word">카카오톡으로 시작</div>
    </div>
</div>
 */