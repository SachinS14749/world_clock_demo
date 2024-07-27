import 'package:flutter/material.dart';
import 'package:world_clock_demo/Service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locationList = [
    WorldTime(endPoint: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        endPoint: 'Europe/Berlin', location: 'Greece', flag: 'greece.png'),
    WorldTime(
        endPoint: 'Europe/Berlin', location: 'Germany', flag: 'germany.png'),
    WorldTime(endPoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        endPoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        endPoint: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        endPoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        endPoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        endPoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(endPoint: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(
        endPoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        endPoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        endPoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(endPoint: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  ];

  void updateLocation(int index) async {
    WorldTime worldTime = locationList[index];
    //API call on instance
    await worldTime.getTime();
    //2nd argument is the data we want to send back to previous screen. Map in our case.
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Choose a location',
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Card(
              child: ListTile(
                  title: Text(locationList[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${locationList[index].flag}'),
                  ),
                  onTap: () {
                    updateLocation(index);
                  }),
            ),
          );
        },
      ),
    );
  }
}
