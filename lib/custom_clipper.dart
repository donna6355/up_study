import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

import 'package:flutter/services.dart';

class CustomClipperSample extends StatelessWidget {
  const CustomClipperSample({super.key});

  Future<ui.Image> _bgImage() async {
    final path = await rootBundle.load('assets/isaac.jpg');
    return await decodeImageFromList(Uint8List.sublistView(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Custom Clipper Painter Test"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: OuterClipper(),
                child: Container(
                  width: double.infinity,
                  height: 202,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: ClipPath(
                  clipper: InnerClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage('assets/isaac.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Image.asset("assets/carev_logo.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OuterClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo((size.width / 2 - 104), 0)
      ..cubicTo((size.width / 2 - 79), 0, (size.width / 2 - 84), 28,
          (size.width / 2 - 64), 28)
      ..lineTo((size.width / 2 + 64), 28)
      ..cubicTo((size.width / 2 + 84), 28, (size.width / 2 + 79), 0,
          (size.width / 2 + 104), 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
    //CustomClipper는 코드를 까보면 listenable을 상속하고 있다.
    //true로 두면, listener를 붙이고 새로운 커스텀 클리퍼가 들어올 때 마다 도형을 다시 그려주게 할 수 있다.
    //핫리로드도 포함되기 때문에 도형을 새로 그리는 동작을 원치 않더라도 디버그 시에는 true로 해두자.
  }
}

class InnerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo((size.width / 2 - 105), 0)
      ..cubicTo((size.width / 2 - 80), 0, (size.width / 2 - 85), 28,
          (size.width / 2 - 65), 28)
      ..lineTo((size.width / 2 + 65), 28)
      ..cubicTo((size.width / 2 + 85), 28, (size.width / 2 + 80), 0,
          (size.width / 2 + 105), 0)
      // ..lineTo((size.width / 2 + 40), 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
    //CustomClipper는 코드를 까보면 listenable을 상속하고 있다.
    //true로 두면, listener를 붙이고 새로운 커스텀 클리퍼가 들어올 때 마다 도형을 다시 그려주게 할 수 있다.
    //핫리로드도 포함되기 때문에 도형을 새로 그리는 동작을 원치 않더라도 디버그 시에는 true로 해두자.
  }
}

class MyPainter extends CustomPainter {
  final ui.Image background;
  const MyPainter(this.background);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    return canvas.drawImage(background, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//https://velog.io/@s_soo100/Flutter-Custom-Clipper-1.-%EA%B8%B0%EC%B4%88%ED%8E%B8
//https://stackoverflow.com/questions/62515552/how-to-add-an-image-as-a-background-with-custompaint