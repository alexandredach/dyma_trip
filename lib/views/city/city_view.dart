import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart' as data;
import '../../views/home/home_view.dart';
import '../../views/city/widgets/trip_activity_list.dart';
import '../../models/city_model.dart';
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

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      final activity = widget.activities.firstWhere((activity) => activity.id == element);
      return prev + activity.price;
    });
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

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Voulez-vous enregistrer ces activités ?'),
          contentPadding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  child: const Text('Enregistrer', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text('Annuler', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                ),
              ],
            )
          ],
        );
      },
    );
    Navigator.pushNamed(context, HomeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.lightBlue,
        title: Text('Organisation du voyage'),
      ),
      drawer: DymaDrawer(),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
                cityName: widget.city.name,
                setDate: setDate,
                trip: myTrip,
                amount: amount,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.directions_walk),
        onPressed: saveTrip,
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
