import 'package:dyma_trip/models/activity_model.dart';
import 'package:dyma_trip/views/city/widgets/trip_activity_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  TripActivityList({super.key, required this.activities, required this.deleteTripActivity });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: activities.map((activity) => TripActivityCard(
        key: ValueKey(activity.id),
        activity: activity,
        deleteTripActivity: deleteTripActivity
        )).toList()
      ),
    );
  }
}
