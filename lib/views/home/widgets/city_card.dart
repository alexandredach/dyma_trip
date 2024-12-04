import 'package:dyma_trip/views/city/city_view.dart';

import '../../../models/city_model.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({ required this.city });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/city',
                    arguments: city,
                  );
                },
              ),
            ),
            // Image left black fade for city name
            // Container(
            //   width: double.infinity,
            //   height: 400,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.bottomCenter,
            //       end: Alignment.topLeft,
            //       colors: [
            //         Colors.transparent, // Transparency begins
            //         Colors.black.withOpacity(0.7), // Transparency opacity
            //       ],
            //     ),
            //   ),
            // ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // Grey box with border radius for city name
                // decoration: BoxDecoration(
                //   color: Colors.black54,
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: Text(
                  city.name,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
