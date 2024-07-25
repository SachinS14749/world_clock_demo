import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
    getTestDataTime();
    print('Only code block inside getData() is blocking using await, not code '
        'outside it. That\'s why you are able to see this message first');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Text("Loading screen")
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

  Future<void> getTestDataTime() async {
    Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Response response = await get(uri);
    Map resMap = jsonDecode(response.body);
    print(resMap);
    String dateTimeStr = resMap["datetime"];
    String utcOffsetStr = resMap["utc_offset"];
    print('$dateTimeStr - $utcOffsetStr');
    DateTime dateTime = DateTime.parse(dateTimeStr);
    int hoursDiff = int.parse(utcOffsetStr.substring(1,3));
    int minDiff = int.parse(utcOffsetStr.substring(4,6));
    String plusOrMinus = utcOffsetStr.substring(0,1);

    if(plusOrMinus == "+") {
      dateTime = dateTime.add(Duration(hours: hoursDiff, minutes: minDiff));
    }else {
      dateTime = dateTime.subtract(Duration(hours: hoursDiff, minutes: minDiff));
    }
    print(dateTime);
  }

}
