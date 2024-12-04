import 'package:dyma_trip/models/city_model.dart';
import 'package:dyma_trip/views/404/not_found.dart';
import 'package:dyma_trip/views/city/city_view.dart';
import 'package:dyma_trip/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});
  
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
        HomeView.routeName: (context) => const HomeView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final City city = settings.arguments as City;
          return MaterialPageRoute(builder: (context) {
            return CityView(city: city);
            }
          );
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      },
    );
  }
}