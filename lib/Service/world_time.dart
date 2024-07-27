import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String endPoint;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.endPoint});

  Future<void> getTime() async {
    try{
      //make the request
      Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/$endPoint');
      Response response = await get(uri);
      Map resMap = jsonDecode(response.body);
      print(resMap);

      // get properties from data
      String dateTimeStr = resMap["datetime"];
      String utcOffsetStr = resMap["utc_offset"];
      print('$dateTimeStr - $utcOffsetStr');

      //create DateTime object and set variables
      DateTime dateTime = DateTime.parse(dateTimeStr);
      int hoursDiff = int.parse(utcOffsetStr.substring(1,3));
      int minDiff = int.parse(utcOffsetStr.substring(4,6));
      String plusOrMinus = utcOffsetStr.substring(0,1);

      if(plusOrMinus == "+") {
        dateTime = dateTime.add(Duration(hours: hoursDiff, minutes: minDiff));
      }else {
        dateTime = dateTime.subtract(Duration(hours: hoursDiff, minutes: minDiff));
      }

      //set the date and time
      // time = dateTime.toString();
      isDayTime = dateTime.hour > 6 && dateTime.hour < 19 ? true : false;
      time = DateFormat.jm().format(dateTime);
    }catch (e){
      print(e);
      time = 'Could not load Date and time';
    }
  }
}
