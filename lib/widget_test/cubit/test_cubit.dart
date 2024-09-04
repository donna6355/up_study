import 'package:flutter_bloc/flutter_bloc.dart';

enum TestState {
  initial,
  inProgress,
  done,
}

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestState.initial);

  Future<void> trigger() async {
    emit(TestState.inProgress);
    await Future.delayed(const Duration(seconds: 1));

    emit(TestState.done);
  }
}
