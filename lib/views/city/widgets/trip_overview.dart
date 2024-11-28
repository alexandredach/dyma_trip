import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  const TripOverview({ super.key, required this.setDate, required this.trip });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paris',
            style: TextStyle(
                fontSize: 25,
                decoration: TextDecoration.underline
            ),
          ),
          const SizedBox(
              height: 30
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat("dd/MM/yyyy").format(trip.date!)
                      : 'Choisissez une date',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                  onPressed: setDate,
                  child: const Text('Sélectionner une date')
              ),
            ],
          ),
          const SizedBox(
              height: 30
          ),
          Row(
            children: [
              const Expanded(
                  child: Text(
                    'Montant / personne',
                    style: TextStyle(fontSize: 15),
                  )
              ),
              Text(
                '$amount €',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
