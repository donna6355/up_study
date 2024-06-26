import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodchannelSample extends StatefulWidget {
  const MethodchannelSample({super.key});

  @override
  State<MethodchannelSample> createState() => _MethodchannelSampleState();
}

class _MethodchannelSampleState extends State<MethodchannelSample> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

// Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel Sample'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
