part of 'demo_bloc.dart';

@immutable
abstract class DemoEvent {}

class LoadDemoEvent extends DemoEvent {

}

class NoInternetConnectionEvent extends DemoEvent {}

class InternetConnectedEvent extends DemoEvent {}
