import 'package:bloc_example/business_logic/bloc/demo/usecase.dart';
import 'package:bloc_example/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'demo_event.dart';

part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  final DemoUseCases demoUseCases;

  DemoBloc({required this.demoUseCases}) : super(InitialDemoState()) {
    on<LoadDemoEvent>((event, emit) async {
      print("---This is what happend now: LoadingDemoState");
      emit(LoadingDemoState());
      emit(await demoUseCases.loadPostsList());
    });

    on<NoInternetConnectionEvent>((event, emit)
    {
      emit(NoInterNetConnectionState());
    });
    on<InternetConnectedEvent>((event, emit)
    {
      emit(InterNetConnectedState());
    });
  }
}
