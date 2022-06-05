import 'package:bloc_example/business_logic/bloc/counter/bloc.dart';
import 'package:bloc_example/business_logic/bloc/counter/states.dart';
import 'package:bloc_example/business_logic/bloc/demo/demo_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This is Post List")),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<CounterBloc, CounterStates>(
                builder: (context, state) {
                  if (state is SuccessCounterState) {
                    return Text(
                      "This is the counter value: ${state.count}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    );
                  }
                  return const Text("This is the counter value: UnKnown");
                },
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<DemoBloc, DemoState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      context.read<DemoBloc>().add(LoadDemoEvent());
                    },
                    child: const Text("Get Data From the internet"),
                  );
                },
              ),
              BlocBuilder<DemoBloc, DemoState>(
                builder: (context, state) {
                  if (state is LoadingDemoState) {
                    return const CircularProgressIndicator(
                      color: Colors.teal,
                    );
                  } else if (state is ErrorDemoState) {
                    return Text("There is an error: ${state.error}");
                  } else if (state is LoadedDemoState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, i) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                state.posts[i].title,
                              ),
                              leading: Text(state.posts[i].userId.toString(),
                                  maxLines: 1),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
