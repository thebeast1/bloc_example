part of 'demo_bloc.dart';

@immutable
abstract class DemoState {}

class InitialDemoState extends DemoState {}

class LoadingDemoState extends DemoState {}

class LoadedDemoState extends DemoState {
  final List<Post> posts;

  LoadedDemoState({required this.posts});
}

class ErrorDemoState extends DemoState {
  final String error;

  ErrorDemoState({required this.error});
}
