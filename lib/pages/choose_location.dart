import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a location',),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Text("Choose a location screen"),

    );
  }
}
