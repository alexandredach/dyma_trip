import 'package:dyma_trip/models/activity.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  TripActivityList({super.key, required this.activities, required this.deleteTripActivity });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context, index) {
            var activity = activities[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(activities[index].image),
              ),
              title: Text(activity.name),
              subtitle: Text(activity.city),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  deleteTripActivity(activity.id);
                },
              ),
            );
          },
        itemCount: activities.length,
      ),
    );
  }
}
