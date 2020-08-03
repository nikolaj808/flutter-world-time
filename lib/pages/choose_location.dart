import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Copenhagen', flag: 'denmark.png', url: '/Europe/Copenhagen'),
    WorldTime(location: 'Los Angeles', flag: 'usa.png', url: '/America/Los_Angeles'),
    WorldTime(location: 'New York', flag: 'usa.png', url: '/America/New_York'),
    WorldTime(location: 'Melbourne', flag: 'australia.png', url: '/Australia/Melbourne'),
    WorldTime(location: 'Amsterdam', flag: 'netherlands.png', url: '/Europe/Amsterdam'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate to the home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
