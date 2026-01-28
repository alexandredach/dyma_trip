import 'package:dyma_trip/providers/city_provider.dart';
import 'package:dyma_trip/providers/trip_provider.dart';
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
  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
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
          '/': (context) => HomeView(cities: []),
          CityView.routeName: (context) => CityView(city: null, addTrip: null,)
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