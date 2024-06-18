import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NfcNativeSample extends StatefulWidget {
  const NfcNativeSample({super.key});

  @override
  State<NfcNativeSample> createState() => _NfcNativeSampleState();
}

class _NfcNativeSampleState extends State<NfcNativeSample> {
  static const platform = MethodChannel('samples.flutter.dev/nfc');
  static const platformEvent = EventChannel('samples.flutter.dev/nfcevent');
  late StreamSubscription<dynamic> _eventSubscription;
  dynamic res = 'NOT STARTED';

  Future<void> checkNfc() async {
    try {
      final result = await platform.invokeMethod<bool>('isNfcAvailable');
      setState(() {
        res = 'NFC IS ON : $result';
      });
    } catch (e) {
      setState(() {
        res = 'FAILED $e';
      });
    }
  }

  Future<void> initNfc() async {
    try {
      final result = await platform.invokeMethod(
        'initNfc',
        {
          'permanentApduResponses': true,
          'listenOnlyConfiguredPorts': false,
          //D4100000030001 티머니 aid
          'aid': Uint8List.fromList([0xD4, 0x10, 0x00, 0x00, 0x03, 0x00, 0x01]),
          'cla': null,
          'ins': null,
        },
      );
      setState(() {
        res = 'NFC INIT : $result';
      });
    } catch (e) {
      setState(() {
        res = 'FAILE TO INIT : $e';
      });
    }
  }

  Future<void> addRes() async {
    try {
      final result = await platform.invokeMethod(
        'addRes',
        {
          'port': 0,
          'data': Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]),
        },
      );
      setState(() {
        res = 'NFC RES ADDED : $result';
      });
    } catch (e) {
      setState(() {
        res = 'FAILED TO ADD NFC RES : $e';
      });
    }
  }

  Future<void> removeRes() async {
    try {
      final result = await platform.invokeMethod(
        'removeRes',
        {'port': 0},
      );
      setState(() {
        res = 'NFC RES REMOVED : $result';
      });
    } catch (e) {
      setState(() {
        res = 'FAILED TO REMOVE NFC RES : $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _eventSubscription = platformEvent.receiveBroadcastStream().listen((event) {
      print(event);
    });
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Native'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: checkNfc,
            child: const Text('Check NFC Availability'),
          ),
          ElevatedButton(
            onPressed: initNfc,
            child: const Text('init NFC'),
          ),
          ElevatedButton(
            onPressed: addRes,
            child: const Text('ADD NFC RES'),
          ),
          ElevatedButton(
            onPressed: removeRes,
            child: const Text('remove NFC res'),
          ),
          Text(res),
        ],
      ),
    );
  }
}
