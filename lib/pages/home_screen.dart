import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;
    print(data);
    String bgImg = data?['isDayTime'] ? 'day.png' : 'night.png';
    Color notificationStripColor = data?['isDayTime'] ? Colors.blue : Colors.deepPurple;
    return Scaffold(
      backgroundColor: notificationStripColor,
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$bgImg'),
            fit: BoxFit.cover
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                TextButton.icon(
                  label: Text('Go to Location', style: TextStyle(color: Colors.white),),
                    icon: const Icon(Icons.edit_location,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      dynamic results = await Navigator.pushNamed(context, '/pick_location');
                      setState(() {
                        data = {
                          'location' : results['location'],
                          'flag': results['flag'],
                          'time': results['time'],
                          'isDayTime' : results['isDayTime']
                        };
                      });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                ),),
                const SizedBox(height: 50,),
                Text(data?['location'], style: TextStyle(fontSize: 32, color: Colors.white, letterSpacing: 2, fontWeight: FontWeight.bold),),
                Text(data?['time'], style: TextStyle(fontSize: 48, color: Colors.white, letterSpacing: 1),),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
