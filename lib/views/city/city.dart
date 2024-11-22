import 'package:dyma_trip/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import '../../models/activity.model.dart';
import '../../datas/data.dart' as data;
import '../../models/trip.model.dart';
import 'package:intl/intl.dart';

class City extends StatefulWidget {
  City({super.key});

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(DateFormat("dd/MM/yyyy").format(myTrip.date),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: setDate,
                        child: const Text('Sélectionner une date')
                    ),
                  ],
                )
              ],),
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                crossAxisCount: 2,
                children: widget.activities.map((activity) => ActivityCard(activity: activity)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
