import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location = [
    WorldTime(
      url: 'Asia/Kolkata',
      location: 'India/Kolkata',
      flag: 'day.jpg',
    ),
    WorldTime(
      url: 'Africa/Nairobi',
      location: 'Nairobi',
      flag: 'day.jpg',
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Berlin',
      flag: 'night.jpg',
    ),
    WorldTime(
      url: 'Asia/Tokyo',
      location: 'Tokyo',
      flag: 'night.jpg',
    ),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'night.jpg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'night.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'night.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'night.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'night.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'night.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'night.jpg'),
  ];
  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${location[index].flag}')),
                ),
              ),
            );
          }),
    );
  }
}
