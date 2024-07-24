import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ElevatedButton.icon(
            label: Text('Go to Location'),
              icon: const Icon(Icons.edit_location), onPressed: () {
                Navigator.pushNamed(context, '/pick_location');
          }),
        ],
      ),
    ));
  }
}
