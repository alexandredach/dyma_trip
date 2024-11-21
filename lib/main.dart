import 'package:dyma_trip/home.dart';
import 'package:flutter/material.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}