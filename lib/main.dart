import 'package:bloc_example/constants.dart';
import 'package:bloc_example/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Routes _routes = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: _routes.onGenerateRoute,
      initialRoute: KCounterScreen,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _routes.dispose();
  }
}
