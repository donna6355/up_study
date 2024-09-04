import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/widget_test/cubit/test_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestCubit(),
      child: const TestScreenCore(),
    );
  }
}

class TestScreenCore extends StatelessWidget {
  const TestScreenCore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRY WIDGET TEST'),
      ),
      body: BlocBuilder<TestCubit, TestState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('CURRENT STATE IS'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    state.name,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: context.read<TestCubit>().trigger,
                    child: const Text('trigger'))
              ],
            ),
          );
        },
      ),
    );
  }
}
