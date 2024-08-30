import 'package:flutter_bloc/flutter_bloc.dart';

class TestState {
  int num;
  TestState(this.num);
}

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestState(0));

  void increment() => emit(TestState(state.num + 1));
  void decrement() => emit(TestState(state.num - 1));
}
