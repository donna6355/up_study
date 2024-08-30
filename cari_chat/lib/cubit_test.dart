import 'package:cari_chat/cubit/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitTest extends StatelessWidget {
  const CubitTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(),
      child: CubitTestScreen(),
    );
  }
}

class CubitTestScreen extends StatelessWidget {
  const CubitTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        return Material(
          child: Center(
            child: Text('THIS IS COUNT : ${state.num}'),
          ),
        );
      },
    );
  }
}
