import 'package:flutter/material.dart';

import 'device_info.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        print(_controller.size);
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
              DraggableScrollableSheet(
                key: _sheet,
                initialChildSize: 0.5,
                maxChildSize: 0.8,
                minChildSize: 0.1,
                expand: true,
                snap: true,
                snapSizes: const [0.5],
                controller: _controller,
                builder: (_, ctrl) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomScrollView(
                        controller: ctrl,
                        slivers: [
                          SliverList.list(
                            children: const [
                              Text('Content1', style: TextStyle(fontSize: 20)),
                              Text('Content2', style: TextStyle(fontSize: 20)),
                              Text('Content3', style: TextStyle(fontSize: 20)),
                              Text('Contente', style: TextStyle(fontSize: 20)),
                              Text('Content5', style: TextStyle(fontSize: 20)),
                              Text('Content6', style: TextStyle(fontSize: 20)),
                              Text('Content7', style: TextStyle(fontSize: 20)),
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
                        ],
                      ),
                    ),
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
