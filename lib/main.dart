import 'package:dyma_trip/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data.dart' as data;
import '/views/trips/trips_view.dart';
import '/views/trip/trip_view.dart';
import '../models/city_model.dart';
import '../views/404/not_found.dart';
import '../views/city/city_view.dart';
import '../views/home/home_view.dart';
import 'models/activity_model.dart';
import 'models/trip_model.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  // final List<City> cities = data.cities;

  DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  // List<Trip> trips = [
  //   Trip(city: 'Paris', activities: [], date: DateTime.now().add(const Duration(days: 15))),
  //   Trip(city: 'Lyon', activities: [
  //     Activity(
  //       image: 'assets/images/activities/lyon/notre-dame-fourviere.jpg',
  //       name: 'Basilique Notre-Dame de Fourvière',
  //       id: 'l1',
  //       city: 'Lyon',
  //       price: 0,
  //     ),
  //     Activity(
  //       image: 'assets/images/activities/lyon/traboules.jpg',
  //       name: 'Le Vieux Lyon et ses traboules',
  //       id: 'l2',
  //       city: 'Lyon',
  //       price: 0,
  //     ),
  //     Activity(
  //       image: 'assets/images/activities/lyon/musee-confluences.jpg',
  //       name: 'Musée des Confluences',
  //       id: 'l3',
  //       city: 'Lyon',
  //       price: 9.00,
  //     ),
  //     Activity(
  //       image: 'assets/images/activities/lyon/parc-tete-or.jpg',
  //       name: 'Parc de la Tête d’Or',
  //       id: 'l4',
  //       city: 'Lyon',
  //       price: 0,
  //     ),
  //   ], date: DateTime.now().add(const Duration(days: 41))),
  //   Trip(city: 'Nice', activities: [], date: DateTime.now().subtract(const Duration(days: 125))),
  // ];

  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CityProvider();
      },
      child: MaterialApp(
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
          HomeView.routeName: (context) => HomeView(cities: [],),
        },
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case CityView.routeName: {
        //       return MaterialPageRoute(builder: (context) {
        //         final City city = settings.arguments as City;
        //         return CityView(
        //           city: city,
        //           addTrip: addTrip,
        //         );
        //         }
        //       );
        //     }
        //     case TripsView.routeName: {
        //       return MaterialPageRoute(builder: (context) {
        //         return TripsView(trips: trips);
        //         }
        //       );
        //     }
        //     case TripView.routeName: {
        //       return MaterialPageRoute(builder: (context) {
        //         String? tripId = (settings.arguments as Map<String, String>)['tripId'];
        //         String? cityName = (settings.arguments as Map<String, String>)['cityName'];
        //         return TripView(
        //             trip: trips.firstWhere((trip) => trip.id == tripId),
        //             city: widget.cities.firstWhere((city) => city.name == cityName),
        //         );
        //       }
        //       );
        //     }
        //   }
        //   return null;
        // },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const NotFound());
        },
      ),
    );
  }
}