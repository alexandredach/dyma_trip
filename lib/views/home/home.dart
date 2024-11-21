import 'package:flutter/material.dart';
import 'widgets/city_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    { 'name': 'Lyon', 'image': 'assets/images/lyon.jpg', 'checked': false },
    { 'name': 'Nice', 'image': 'assets/images/nice.jpg', 'checked': false },
    { 'name': 'Paris', 'image': 'assets/images/paris.jpg', 'checked': false },
  ];

  void switchChecked (city) {
    var index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        leading: const Icon(Icons.home),
        title: const Text('Dymatrip') ,
        actions: const [Icon((Icons.more_vert))],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...cities.map( (city) {
              return CityCard(
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () {
                  switchChecked(city);
                },
              );
            }),
          ],
        )
      ),
    );
  }
}
