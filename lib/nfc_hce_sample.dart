import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_host_card_emulation/nfc_host_card_emulation.dart';

class NfcHceSample extends StatefulWidget {
  const NfcHceSample({super.key});

  @override
  State<NfcHceSample> createState() => _NfcHceSampleState();
}

class _NfcHceSampleState extends State<NfcHceSample> {
  bool _nfcOn = false;
  bool apduAdded = false;

  // change port here
  final port = 0;
  // change data to transmit here
  final data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  // this will be changed in the NfcHce.stream listen callback
  NfcApduCommand? nfcApduCommand;

  Future<void> checkNFC() async {
    NfcState nfcState = await NfcHce.checkDeviceNfcState();
    setState(() => _nfcOn = nfcState == NfcState.enabled);
  }

  Future<void> initNfc() async {
    if (_nfcOn) {
      await NfcHce.init(
        // AID that match at least one aid-filter in apduservice.xml
        // In my case it is A000DADADADADA.
        aid: Uint8List.fromList([0xA0, 0x00, 0xDA, 0xDA, 0xDA, 0xDA, 0xDA]),
        // next parameter determines whether APDU responses from the ports
        // on which the connection occurred will be deleted.
        // If `true`, responses will be deleted, otherwise won't.
        permanentApduResponses: true,
        // next parameter determines whether APDU commands received on ports
        // to which there are no responses will be added to the stream.
        // If `true`, command won't be added, otherwise will.
        listenOnlyConfiguredPorts: false,
      );
      NfcHce.stream.listen((cmd) {
        setState(() {
          setState(() => nfcApduCommand = cmd);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkNFC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HCE TEST'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('NFC IS ${_nfcOn ? 'UNAVAILABLE' : "AVAILABLE"}'),
          SizedBox(
            height: 200,
            width: 300,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  apduAdded ? Colors.redAccent : Colors.greenAccent,
                ),
              ),
              onPressed: () async {
                await initNfc();
                if (apduAdded == false) {
                  await NfcHce.addApduResponse(port, data);
                } else {
                  await NfcHce.removeApduResponse(port);
                }

                setState(() => apduAdded = !apduAdded);
              },
              child: FittedBox(
                child: Text(
                  apduAdded
                      ? 'remove\n$data\nfrom\nport $port'
                      : 'add\n$data\nto\nport $port',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: apduAdded ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          if (nfcApduCommand != null)
            Text(
              'You listened to the stream and received the '
              'following command on the port ${nfcApduCommand!.port}:\n'
              '${nfcApduCommand!.command}\n'
              'with additional data ${nfcApduCommand!.data}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
