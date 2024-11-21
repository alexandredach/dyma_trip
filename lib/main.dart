import 'package:flutter/material.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              Card(
                elevation: 5, // card shadow
                child: Container(
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset('assets/images/paris.jpg', fit: BoxFit.cover)
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}