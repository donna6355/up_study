import 'dart:async';

import 'package:flutter/material.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final _controller = DraggableScrollableController();

  bool visible = true;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        visible = _controller.size > 0.8 ? false : true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.removeListener;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (_controller.size > 0.4) {
          _controller.animateTo(
            0.1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeInOut,
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(80),
                child: PolyButton(),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.5,
                maxChildSize: 1,
                minChildSize: 0,
                expand: true,
                snap: true,
                snapSizes: const [0.5],
                controller: _controller,
                builder: (_, ctrl) {
                  return CustomScrollView(
                    controller: ctrl,
                    slivers: [
                      SliverList.list(
                        children: [
                          if (visible)
                            Image.asset(
                              'assets/isaac.jpg',
                              height: 100,
                            ),
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Content1',
                                    style: TextStyle(fontSize: 20)),
                                Text('Content2',
                                    style: TextStyle(fontSize: 20)),
                                Text('Content3',
                                    style: TextStyle(fontSize: 20)),
                                Text('Contente',
                                    style: TextStyle(fontSize: 20)),
                                Text('Content5',
                                    style: TextStyle(fontSize: 20)),
                                Text('Content6',
                                    style: TextStyle(fontSize: 20)),
                                Text('Content7',
                                    style: TextStyle(fontSize: 20)),
                                Text('Conten8t'),
                                Text('Content9'),
                                Text('Conten0t'),
                                Text('Conten1t'),
                                Text('Content'),
                                Text('Conten1t'),
                                Text('Content2'),
                                Text('Content'),
                                Text('Contenwet'),
                                Text('Contendast'),
                                Text('Contenzcvt'),
                                Text('Contentzxcv'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer({required this.milliseconds});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class Polygon extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    Path path = Path()
      ..moveTo(0, 16)
      ..lineTo(16, 0)
      ..lineTo(w, 8)
      ..lineTo(w, h - 16)
      ..lineTo(w - 16, h)
      ..lineTo(16, h - 16)
      ..lineTo(0, h - 40)
      ..lineTo(0, 16)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class PolyBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.blue;
    final double w = size.width;
    final double h = size.height;
    Path path = Path()
      ..moveTo(0, 16)
      ..lineTo(16, 0)
      ..lineTo(w, 8)
      ..lineTo(w, h - 16)
      ..lineTo(w - 16, h)
      ..lineTo(16, h - 16)
      ..lineTo(0, h - 40)
      ..lineTo(0, 16)
      ..close();

    canvas
      ..drawPath(path, paint)
      ..drawShadow(path, Colors.black, 20, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PolyButton extends StatelessWidget {
  const PolyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: PolyBorder(),
          child: SizedBox(width: 170, height: 232),
        ),
        ClipPath(
          clipper: Polygon(),
          child: GestureDetector(
            onTap: () => print("object"),
            child: Container(
              width: 170,
              height: 232,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
