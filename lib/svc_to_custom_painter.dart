import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SvgToCustom extends StatelessWidget {
  const SvgToCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SVG to Custom Painter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // child: CustomPaint(
        //   size: const Size(183, 220),
        //   painter: RPSCustomPainter(),
        // ),
        children: [
          Text(
              'CUSTOM PAINTER\n커스텀 페인터로 그린 도형의 GestureDetector는 무조건 사각형으로 범위가 잡힘\n아래와 같은 퍼즐 모양에서 빈 부분도 탭이 읽힘...ㅠㅠ'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => print("LEFT PUZZLE TAPPED!!!!!"),
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: LeftPuzzle(),
                ),
              ),
              GestureDetector(
                onTap: () => print("!!!!!!!!!!RIGHT PUZZLE TAPPED"),
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: RightPuzzle(),
                ),
              )
            ],
          ),
          const SizedBox(height: 100),
          Text(
              'CUSTOM CLIPPER\n커스텀 클리퍼로 자른 경우 빈 부분은 탭 인식 안됨. 빈 부분 오버랩된 상태로도 그려진 부분만 인식 잘됨'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => print("&&&&&&&&&&&CLIPPER LEFT&&&&&&&&&&&"),
                child: ClipPath(
                  clipper: LeftPuzzleClipper(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/isaac.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => print("*************CLIPPER RIGHT*************"),
                child: ClipPath(
                  clipper: RightPuzzleClipper(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/fangs.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LeftPuzzleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    const Radius raidus = Radius.circular(10);
    Path path = Path()
      ..lineTo(width - 10, 0)
      ..arcToPoint(
        Offset(width, 10),
        radius: raidus,
      )
      ..lineTo(width, height / 2 - 10)
      ..arcToPoint(
        Offset(width - 10, height / 2),
        radius: raidus,
      )
      ..lineTo(width / 2 + 10, height / 2)
      ..arcToPoint(
        Offset(width / 2, height / 2 + 10),
        radius: raidus,
        clockwise: false,
      )
      ..lineTo(width / 2, height - 10)
      ..arcToPoint(
        Offset(width / 2 - 10, height),
        radius: raidus,
      )
      ..lineTo(10, height)
      ..arcToPoint(
        Offset(0, height - 10),
        radius: raidus,
      )
      ..lineTo(0, 10)
      ..arcToPoint(
        Offset(10, 0),
        radius: raidus,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class RightPuzzleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    Path path = Path()
      ..moveTo(width, 0)
      ..lineTo(width / 2, 0)
      ..lineTo(width / 2, height / 2)
      ..lineTo(0, height / 2)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class LeftPuzzle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..lineTo(width, 0)
      ..lineTo(width, height / 2)
      ..lineTo(width / 2, height / 2)
      ..lineTo(width / 2, height)
      ..lineTo(0, height)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RightPuzzle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(width, 0)
      ..lineTo(width / 2, 0)
      ..lineTo(width / 2, height / 2)
      ..lineTo(0, height / 2)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
