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
    getData();
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

}
