import 'package:bloc_example/business_logic/bloc/counter/bloc.dart';
import 'package:bloc_example/business_logic/bloc/demo/demo_bloc.dart';
import 'package:bloc_example/constants.dart';
import 'package:bloc_example/data/repository/demo_repository.dart';
import 'package:bloc_example/data/web_services/demo_web_services.dart';
import 'package:bloc_example/presentation/counter_screen.dart';
import 'package:bloc_example/presentation/demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  final DemoBloc _demoBloc =
      DemoBloc(demoRepository: DemoRepository(DemoWebServices()));

  final CounterBloc _counterBloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case KCounterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterScreen(),
          ),
        );
      case KDemoScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: BlocProvider.value(
              value: _demoBloc,
              child: const DemoScreen(),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const CounterScreen(),
          ),
        );
    }
  }

  void dispose() {
    _counterBloc.close();
    _demoBloc.close();
  }
}
