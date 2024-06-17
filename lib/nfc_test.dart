// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';
// import 'package:nfc_manager/platform_tags.dart';

// class NfcTest extends StatefulWidget {
//   const NfcTest({super.key});

//   @override
//   State<NfcTest> createState() => _NfcTestState();
// }

// class _NfcTestState extends State<NfcTest> {
//   bool nfcAvailable = false;
//   String data = '';

//   Future<void> _checkNfcAvailability() async {
//     bool isAvailable = await NfcManager.instance.isAvailable();
//     setState(() => nfcAvailable = isAvailable);
//   }

//   Future<void> _readTag() async {
//     setState(() => data = 'Reading...');
//     NfcManager.instance.startSession(
//       pollingOptions: {},
//       onDiscovered: (NfcTag tag) async {
//         setState(() => data = tag.data.toString());
//         print(tag.data.toString());
//         var isoTag = IsoDep.from(tag);
//         if (isoTag != null) {
//           print(String.fromCharCodes(isoTag!.identifier));
//           final tagId = isoTag.identifier
//               .map((e) => e.toRadixString(16).padLeft(2, '0'))
//               .join('');
//           print('mapped tagId = $tagId');
//         }
//         NfcManager.instance.stopSession();
//       },
//       onError: (e) async {
//         NfcManager.instance.stopSession(alertMessage: e.toString());
//       },
//     );
//   }

//   Future<void> _writeTag() async {
//     setState(() => data = 'Writing...');
//     NfcManager.instance.startSession(
//       onDiscovered: (NfcTag tag) async {
//         print(tag);
//         var ndef = Ndef.from(tag);
//         if (ndef == null || !ndef.isWritable) {
//           setState(() => data = 'Tag is not NDEF');
//           NfcManager.instance.stopSession(errorMessage: data);
//           return;
//         }

//         NdefMessage message = NdefMessage([
//           NdefRecord.createText('Hello World!'),
//           NdefRecord.createUri(Uri.parse('https://flutter.dev')),
//           NdefRecord.createMime(
//               'text/plain', Uint8List.fromList('Hello'.codeUnits)),
//           NdefRecord.createExternal(
//               'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
//         ]);

//         try {
//           await ndef.write(message);

//           setState(() => data = 'Success to "Ndef Write"');
//           NfcManager.instance.stopSession();
//         } catch (e) {
//           setState(() => data = e.toString());
//           NfcManager.instance.stopSession(errorMessage: data);
//           return;
//         }
//       },
//       onError: (e) async {
//         NfcManager.instance.stopSession(alertMessage: e.toString());
//       },
//     );
//   }

//   String decodeNdef(NfcTag tag) {
//     //ndef = NFC data exchange format
//     Ndef? ndef = Ndef.from(tag);
//     NdefMessage? nfcMessage = ndef?.cachedMessage;
//     //ndef message > ndef record > header(record에 대한 기본정보) + payload(첫 바이트는 페이로드의 헤더, 나머지는 페이로드 데이터)
//     //페이로드의 타입이 text/plain 인 것을 찾는다
//     NdefRecord? textTypeData = nfcMessage?.records
//         .firstWhere((e) => utf8.decode(e.type) == 'text/plain');

//     if (textTypeData != null) {
//       Uint8List uint8ListData = Uint8List.fromList(textTypeData.payload);
//       //페이로드의 첫 바이트는 페이로드의 헤더이므로 제외하고 utf8로 디코딩한다.
//       return utf8.decode(uint8ListData.sublist(1));
//     }
//     return 'null';
//   }

//   @override
//   void dispose() {
//     NfcManager.instance.stopSession();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NFC Test'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Text('NFC : $nfcAvailable'),
//           Text(data),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Divider(height: 2, color: Colors.green),
//           ),
//           ElevatedButton(
//             onPressed: _checkNfcAvailability,
//             child: const Text('check NFC'),
//           ),
//           ElevatedButton(
//             onPressed: _readTag,
//             child: const Text('read NFC'),
//           ),
//           ElevatedButton(
//             onPressed: _writeTag,
//             child: const Text('write NFC'),
//           ),
//         ],
//       ),
//     );
//   }
// }
