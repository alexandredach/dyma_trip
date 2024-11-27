import 'package:dyma_trip/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';
import '../../models/activity.model.dart';
import '../../datas/data.dart' as data;
import '../../models/trip.model.dart';

class City extends StatefulWidget {
  City({super.key});

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());
  int index = 0;

  void setDate() {
    showDatePicker(
        context: context, 
        initialDate: DateTime.now().add(Duration(days: 1)),
        firstDate:  DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    ).then((newDate) {
      if(newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        leading: Icon(Icons.chevron_left),
        title: Text('Organisation du voyage'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(setDate: setDate, trip: myTrip),
            Expanded(
              child: index == 0 ? ActivityList(activities: widget.activities) : TripActivityList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Découverte',),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Mes activités',)
        ],
        onTap: switchIndex,
      ),
    );
  }
}
