import 'package:dyma_trip/views/trip/widgets/trip_city_bar.dart';
import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import '../../models/trip_model.dart';

class TripView extends StatefulWidget {
  static const String routeName = '/trip';
  final Trip trip;
  final City city;

  const TripView({
    super.key,
    required this.trip,
    required this.city
  });

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TripCityBar(city: widget.city),
              Container(
                height: 800,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
