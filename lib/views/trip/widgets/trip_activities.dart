import 'package:flutter/material.dart';
import '../../../models/activity_model.dart';
import 'trip_activity_list.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  const TripActivities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              // color: Theme.of(context).primaryColor,
              child: const TabBar(
                // indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(text: 'En cours'),
                  Tab(text: 'Terminé'),
                ],
              ),
            ),
            Container(
              height: 600,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TripActivityList(activities: activities),
                  TripActivityList(activities: activities),
                ]
              ),
            )
          ],
        )
      ),
    );
  }
}
