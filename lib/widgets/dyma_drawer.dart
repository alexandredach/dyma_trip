import 'package:flutter/material.dart';

import '../views/trips/trips_view.dart';
import '../views/home/home_view.dart';

class DymaDrawer extends StatelessWidget {
  const DymaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Dymatrip',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.blueAccent.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          // Divider(color: Colors.blueGrey,),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: () {
              Navigator.pushNamed(context, TripsView.routeName);
            },
          ),

        ],
      ),
    );
  }
}
