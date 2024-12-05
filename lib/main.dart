import 'package:dyma_trip/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import '../data/data.dart' as data;
import '../models/city_model.dart';
import '../views/404/not_found.dart';
import '../views/city/city_view.dart';
import '../views/home/home_view.dart';
import 'models/trip_model.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;

  DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
    print(trips);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 25,
              color: Colors.black,
          ),
        ),
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
            bodySmall: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.routeName: (context) => HomeView(cities: widget.cities),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName: {
            return MaterialPageRoute(builder: (context) {
              final City city = settings.arguments as City;
              return CityView(
                city: city,
                addTrip: addTrip,
              );
              }
            );
          }
          case TripsView.routeName: {
            return MaterialPageRoute(builder: (context) {
              return TripsView();
              }
            );
          }

        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      },
    );
  }
}