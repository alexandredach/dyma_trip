import 'package:dyma_trip/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import '../../models/activity.model.dart';
import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  City({super.key});

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: widget.activities
            .map(
              (activity) => ActivityCard(activity: activity),
            )
            .toList(),
        ),
      ),
    );
  }
}
