import 'package:bloc_example/business_logic/bloc/counter/events.dart';
import 'package:bloc_example/business_logic/bloc/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int count = 0;

  CounterBloc() : super( InitialCounterState() )
  {
    // on listen to the event......
    on<IncrementCounterValue>((event, emit) async {
      emit(LoadingCounterState());

      emit(await _changeValue('in'));

    });
    on<DecrementCounterValue>((event, emit) async {
      emit(LoadingCounterState());
      emit(await _changeValue('de'));
    });
  }

  Future<CounterStates> _changeValue(String s) async {
    print("START DELAY");
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        print("Finish DELAY");
      },
    );
    switch (s) {
      case 'in':
        count++;
        break;
      case 'de':
        if (count != 0) {
          count--;
        } else {
          print('can not be less than zero');
          return ErrorCountState(error: 'error less than 0');
        }
        break;
    }
    return SuccessCounterState(count: count, type: s);
  }
}
