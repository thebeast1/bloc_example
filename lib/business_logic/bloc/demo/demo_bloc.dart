import 'dart:async';

import 'package:bloc_example/data/models/post.dart';
import 'package:bloc_example/data/repository/demo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'demo_event.dart';

part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  List<Post> _posts = [];
  final DemoRepository demoRepository;

  DemoBloc({required this.demoRepository}) : super(InitialDemoState()) {
    on<LoadDemoEvent>((event, emit) async {
      print("---This is what happend now: LoadingDemoState");
      emit(LoadingDemoState());
      emit(await _loadPostsList());
    });
  }

  Future<DemoState> _loadPostsList() async {
    print("---This is what happend now: the data is loading...");
    try {
      _posts = await demoRepository.getAllPosts();
      return LoadedDemoState(posts: _posts);
    } catch (e) {
      print("--- demo bloc Error This Error message is from Demo Bloc $e");
      return ErrorDemoState(
        error: e.toString(),
      );
    }
  }
}
