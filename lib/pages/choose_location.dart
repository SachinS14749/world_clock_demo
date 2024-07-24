import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    super.initState();
    getData();
    print('Only code block inside getData() is blocking using await, not code '
        'outside it. That\'s why you are able to see this message first');
  }
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
/*Below getData() is to show that we are running non-blocking code. */
/*void getData() {
  //It will not block the code and the 2nd param (i.e. function as an argument
  //will trigger after the specified delayed duration.
  Future.delayed(const Duration(seconds: 3), () {
    print('yoshi');
  });
  Future.delayed(const Duration(seconds: 2), () {
    print('vegan, musician and egg collector');
  });
  print('statement');
}*/

/*Below getData() is to show that we are running blocking code which is inside method block only. */
void getData() async{
  //It will not block the code and the 2nd param (i.e. function as an argument
  //will trigger after the specified delayed duration.
  String name = await Future.delayed(const Duration(seconds: 3), () {
    return 'yoshi';
  });
  String hobbies = await Future.delayed(const Duration(seconds: 2), () {
    return 'vegan, musician and egg collector';
  });
  print('$name - $hobbies');
}
