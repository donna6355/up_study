import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  dynamic _deviceData;

  Future<void> initPlatformState(bool forAos) async {
    dynamic deviceData;

    try {
      deviceData = forAos
          ? await AndroidId().getId() ??
              'Unknown ID' // may change upon factory reset
          : (await deviceInfoPlugin.iosInfo)
              .identifierForVendor; // change once app deleted and reinstalled
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () => initPlatformState(true),
            child: Text('Get Aos Info'),
          ),
          ElevatedButton(
            onPressed: () => initPlatformState(false),
            child: Text('Get Ios Info'),
          ),
          Text(_deviceData.toString()),
        ],
      ),
    );
  }
}
