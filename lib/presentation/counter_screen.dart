import 'package:bloc_example/business_logic/bloc/counter/bloc.dart';
import 'package:bloc_example/business_logic/bloc/counter/events.dart';
import 'package:bloc_example/business_logic/bloc/counter/states.dart';
import 'package:bloc_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter BLoc'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<CounterBloc, CounterStates>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      heroTag: "increase",
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(IncrementCounterValue());
                      },
                      child: const Icon(Icons.add),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                BlocBuilder<CounterBloc, CounterStates>(
                  builder: (context, state) {
                    if (state is SuccessCounterState) {
                      return Text(
                        state.count.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      );
                    } else if (state is ErrorCountState) {
                      return Text(
                        state.error.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      );
                    } else if (state is LoadingCounterState) {
                      return Text(
                        state.loading.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      );
                    } else if (state is InitialCounterState) {
                      return const Text(
                        "0",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                BlocBuilder<CounterBloc, CounterStates>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      heroTag: "Decrease",
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(DecrementCounterValue());
                      },
                      child: const Icon(Icons.remove),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 18),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, KDemoScreen);
                },
                child: const Text("Go To Demo"))
          ],
        ),
      ),
    );
  }
}
