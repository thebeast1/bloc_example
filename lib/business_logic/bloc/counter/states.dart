import 'package:flutter/foundation.dart';

@immutable
abstract class CounterStates {}

class InitialCounterState extends CounterStates {}

class LoadingCounterState extends CounterStates {
  final String loading = "loading..";
}

class SuccessCounterState extends CounterStates {
  final String type;
  final int count;

  SuccessCounterState({required this.count, required this.type});
}

class ErrorCountState extends CounterStates {
  final String error;

  ErrorCountState({required this.error});
}
