import 'package:bloc_test/bloc_test.dart';
import 'package:cari_chat/cubit/test_cubit.dart';
import 'package:cari_chat/cubit_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTestCubit extends MockCubit<TestState> implements TestCubit {}

class MockTestState extends Fake implements TestState {}

void main() {
  late final mockCubit;
  setUpAll(() {
    //반드시 mockState를 먼저 설정하고 cubit 할당할것!!!
    registerFallbackValue(MockTestState());
    mockCubit = MockTestCubit();
  });
  testWidgets('cubit test ...', (tester) async {
    when(() => mockCubit.state).thenAnswer((invocation) => TestState(1));
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TestCubit>(
          create: (_) => mockCubit,
          child: const CubitTestScreen(),
        ),
      ),
    );
  });
}
