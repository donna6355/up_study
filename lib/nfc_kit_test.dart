// import 'package:flutter/material.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:nfc_manager/nfc_manager.dart';

// class NfcKitTest extends StatefulWidget {
//   const NfcKitTest({super.key});

//   @override
//   State<NfcKitTest> createState() => _NfcKitTestState();
// }

// class _NfcKitTestState extends State<NfcKitTest> {
//   bool nfcAvailable = false;
//   NFCTag? _tag;
//   String _result = '';

//   Future<void> isNfcSupported() async {
//     final available = await FlutterNfcKit.nfcAvailability;
//     setState(() => nfcAvailable = available == NFCAvailability.available);
//   }

//   Future<void> startNfc() async {
//     setState(() => _result = 'start reading NFC...');
//     try {
//       _tag = await FlutterNfcKit.poll();
//       print(_tag.toString());
//     } catch (e) {
//       await FlutterNfcKit.finish();
//     }

//     try {
//       if (_tag?.standard == "ISO 14443-4 (Type B)") {
//         String result1 = await FlutterNfcKit.transceive("00B0950000");
//         String result2 =
//             await FlutterNfcKit.transceive("00A4040009A00000000386980701");
//         setState(() {
//           _result = '1: $result1\n2: $result2\n';
//         });
//       } else if (_tag?.type == NFCTagType.iso18092) {
//         String result1 = await FlutterNfcKit.transceive("060080080100");
//         setState(() {
//           _result = '1: $result1\n';
//         });
//       } else if (_tag?.ndefAvailable ?? false) {
//         var ndefRecords = await FlutterNfcKit.readNDEFRecords();
//         var ndefString = '';
//         for (int i = 0; i < ndefRecords.length; i++) {
//           ndefString += '${i + 1}: ${ndefRecords[i]}\n';
//         }
//         setState(() {
//           _result = ndefString;
//         });
//       } else if (_tag?.type == NFCTagType.webusb) {
//         var r = await FlutterNfcKit.transceive("00A4040006D27600012401");
//         print(r);
//       }
//     } catch (e) {
//       setState(() {
//         _result = 'FAILED $e';
//       });
//     }

//     await FlutterNfcKit.finish();
//   }

//   Future<void> writeNfc() async {
//     setState(() => _result = 'start writing NFC...');

//     try {
//       NFCTag tag = await FlutterNfcKit.poll();
//       print(tag.id);
//       print(tag.type);
//       if (tag.type == NFCTagType.mifare_ultralight ||
//           tag.type == NFCTagType.mifare_classic ||
//           tag.type == NFCTagType.iso15693) {
//         await FlutterNfcKit.writeNDEFRecords([]);
//         setState(() {
//           _result = 'NFC WRITE OK';
//         });
//       } else {
//         setState(() {
//           _result = 'error: NDEF not supported: ${tag.type}';
//         });
//       }
//     } catch (e, stacktrace) {
//       setState(() {
//         _result = 'error: $e';
//       });
//       print(stacktrace);
//     } finally {
//       await FlutterNfcKit.finish();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NFC KIT TEST'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Text('NFC IS ${nfcAvailable ? 'ON' : "OFF"}'),
//           Text(_result),
//           const Padding(
//             padding: EdgeInsets.all(10),
//             child: Divider(
//               height: 2,
//               color: Colors.blue,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: isNfcSupported,
//             child: const Text('Check NFC'),
//           ),
//           ElevatedButton(
//             onPressed: startNfc,
//             child: const Text('start NFC'),
//           ),
//           ElevatedButton(
//             onPressed: writeNfc,
//             child: const Text('write NFC'),
//           ),
//         ],
//       ),
//     );
//   }
// }
