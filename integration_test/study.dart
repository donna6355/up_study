import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:study/main.dart';

//flutter test integration_test/study.dart
/*
- add dev dependency 
  integration_test:
    sdk: flutter
- make integration test dir and file 
- run integration test command
  flutter test $dir/$filename.dart

 */

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      Future<void> navigatePop() async {
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
      }

      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the buttons visible
      expect(find.text('Data Table'), findsOneWidget);
      expect(find.text('Custom Clipper'), findsOneWidget);
      expect(find.text('Custom Google Map'), findsOneWidget);

      // Emulate a tap on the elevated button.
      await tester.tap(find.byKey(const ValueKey('dataTable')));

      // Trigger a frame.
      await tester.pumpAndSettle();
      // Check new screen's app bar title
      expect(find.text('Data Table Test'), findsOneWidget);

      await navigatePop();

      expect(find.text('ENTRY SCREEN'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('customClipper')));
      await tester.pumpAndSettle();
      expect(find.text('Custom Clipper Painter Test'), findsOneWidget);

      await navigatePop();
      expect(find.text('ENTRY SCREEN'), findsOneWidget);
    });
  });
}
