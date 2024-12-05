import 'package:flutter/material.dart';
import '../data/data.dart' as data;
import '/views/trips/trips_view.dart';
import '/views/trip/trip_view.dart';
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
  List<Trip> trips = [
    Trip(city: 'Paris', activities: [], date: DateTime.now().add(const Duration(days: 15))),
    Trip(city: 'Lyon', activities: [], date: DateTime.now().add(const Duration(days: 41))),
    Trip(city: 'Nice', activities: [], date: DateTime.now().subtract(const Duration(days: 125))),
  ];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
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
              return TripsView(trips: trips);
              }
            );
          }
          case TripView.routeName: {
            return MaterialPageRoute(builder: (context) {
              String? tripId = (settings.arguments as Map<String, String>)['tripId'];
              String? cityName = (settings.arguments as Map<String, String>)['cityName'];
              return TripView(
                  trip: trips.firstWhere((trip) => trip.id == tripId),
                  city: widget.cities.firstWhere((city) => city.name == cityName),
              );
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