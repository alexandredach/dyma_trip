import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import '../../views/home/home_view.dart';
import '../../views/city/widgets/trip_activity_list.dart';
import '../../models/city_model.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final City city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  const CityView({
    super.key,
    required this.city,
    required this.addTrip
  });

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
    myTrip = Trip(activities: [], city: widget.city.name, date: null);
  }

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
    });
  }

  void setDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(days: 1)),
        firstDate:  DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))
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

  void toggleActivity(Activity activity) {
    setState(() {
      myTrip.activities.contains(activity)
          ? myTrip.activities.remove(activity)
          : myTrip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      myTrip.activities.remove(activity);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Voulez-vous enregistrer ces activités ?'),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Enregistrer', style: TextStyle(color: Colors.white),),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                  child: const Text('Annuler', style: TextStyle(color: Colors.white),),
                ),
              ],
            )
          ],
        );
      },
    );
    if (myTrip.date == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ATTENTION'),
            content: const Text('Mettez le choix dans la date !'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK')
              ),
            ],
          );
        }
      );
    } else if (result == 'save') {
      widget.addTrip(myTrip);
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.lightBlue,
        title: const Text('Organisation du voyage'),
      ),
      drawer: const DymaDrawer(),
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
                  activities: myTrip.activities,
                  deleteTripActivity: deleteTripActivity,
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: const Icon(Icons.directions_walk),
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
