import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  TripOverview({ required this.setDate, required this.trip });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paris',
            style: TextStyle(
                fontSize: 25,
                decoration: TextDecoration.underline
            ),
          ),
          SizedBox(
              height: 30
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat("dd/MM/yyyy").format(trip.date),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                  onPressed: setDate,
                  child: const Text('Sélectionner une date')
              ),
            ],
          ),
          SizedBox(
              height: 30
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Montant / personne',
                    style: TextStyle(fontSize: 20),
                  )
              ),
              Text(
                '$amount €',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
