import 'package:flutter/material.dart';
import '../../views/city/widgets/trip_activity_list.dart';
import '../../models/city_model.dart';
import '../../data/data.dart' as data;
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final List<Activity> activities = data.activities;
  final City city;

  CityView({super.key, required this.city});

  showContext({required BuildContext context, required List<Widget> children}) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(children: children);
    }
  }

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip myTrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], city: 'Paris', date: null);
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

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

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.lightBlue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left)
        ),
        title: Text('Organisation du voyage'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
                cityName: widget.city.name,
                setDate: setDate,
                trip: myTrip
            ),
            Expanded(
              child: index == 0
                ? ActivityList(
                    activities: widget.activities,
                    selectedActivities: myTrip.activities,
                    toggleActivity: toggleActivity
                )
                : TripActivityList(
                  activities: tripActivities,
                  deleteTripActivity: deleteTripActivity,
                ),
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
