import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study/widget_test/cubit/test_cubit.dart';
import 'package:study/widget_test/test_screen.dart';

class MockTestCubit extends MockCubit<TestState> implements TestCubit {}

void main() {
  testWidgets('test screen ...', (tester) async {
    final cubit = MockTestCubit();

    when(cubit.trigger).thenAnswer((_) async {
      print('triggered!');
    });
    when(() => cubit.state).thenReturn(TestState.initial);
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TestCubit>.value(
            value: cubit, child: const TestScreenCore()),
      ),
    );
    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    expect(find.text(TestState.initial.name), findsOneWidget);
    expect(find.text(TestState.inProgress.name), findsNothing);
    expect(find.text(TestState.done.name), findsNothing);

    await tester.tap(button);
    await tester.pump();

    // can verify if cubit/bloc event/function is invoked
    verify(() => cubit.trigger()).called(1);

    // However, Impossible to updated ui.. probably it has to be handled in integration test
    // when(() => cubit.state).thenReturn(TestState.done);
    // expect(find.text(TestState.initial.name), findsNothing);
    // expect(find.text(TestState.inProgress.name), findsNothing);
    // expect(find.text(TestState.done.name), findsOneWidget);
  });
}
