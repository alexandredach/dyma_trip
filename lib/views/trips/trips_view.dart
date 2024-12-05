import 'package:dyma_trip/widgets/dyma_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';

  const TripsView({super.key});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes voyages'),
      ),
      drawer: DymaDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Text('trips'),
      ),
    );
  }
}
