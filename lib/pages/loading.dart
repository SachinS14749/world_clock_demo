import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_clock_demo/Service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // getData();
    setUpWorldTime();
    print('Only code block inside getData() is blocking using await, not code '
        'outside it. That\'s why you are able to see this message first');
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: SpinKitSpinningLines(
                  color: Colors.blue,
                  size: 80,
                ),
              ),
            )
        ));
  }

  void getData() async{
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(uri);
    print(response.body);
    //To use jsonDecode() we need to import 'dart:convert' package.
    Map map = jsonDecode(response.body);
    print(map);
    print('title key value = ${map['title']}');
  }

  Future<void> setUpWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'India', flag: 'flag', endPoint: 'Asia/Kolkata');
    await worldTime.getTime();
    /*print(worldTime.time);
    setState(() {
      time = worldTime.time;
    });*/
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime' : worldTime.isDayTime
    });
  }

}
