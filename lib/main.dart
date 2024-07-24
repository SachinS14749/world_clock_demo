import 'package:flutter/material.dart';
import 'package:world_clock_demo/pages/choose_location.dart';
import 'package:world_clock_demo/pages/home_screen.dart';
import 'package:world_clock_demo/pages/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /*home: HomeScreen(),*/
        initialRoute: '/hone',
        routes: {
          '/': (context) => Loading(),
          '/hone': (context) => HomeScreen(),
          '/pick_location': (context) => ChooseLocation()
        });
  }
}
