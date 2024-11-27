import 'package:flutter/cupertino.dart';

import '../../../models/activity.model.dart';
import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;

  ActivityList({ required this.activities });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 2,
      children: activities.map((activity) => ActivityCard(activity: activity)).toList(),
    );
  }
}