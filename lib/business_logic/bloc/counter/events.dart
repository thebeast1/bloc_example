import 'package:flutter/foundation.dart';

@immutable
abstract class CounterEvents
{}

class IncrementCounterValue extends CounterEvents {}

class DecrementCounterValue extends CounterEvents {}
