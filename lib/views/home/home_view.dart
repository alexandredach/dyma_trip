import '../../widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/city_card.dart';
import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List cities = [
    City(name: 'Lyon', image: 'assets/images/lyon.jpg'),
    City(name: 'Nice', image: 'assets/images/nice.jpg'),
    City(name: 'Paris', image: 'assets/images/paris.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        title: const Text('Dymatrip', style: TextStyle(color: Colors.white),) ,
      ),
      drawer: DymaDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...cities.map( (city) {
              return CityCard(
                city: city
              );
            }),
          ],
        )
      ),
    );
  }
}
