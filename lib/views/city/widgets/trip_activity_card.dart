import 'dart:math';
import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';

class TripActivityCard extends StatefulWidget {

  final Activity activity;
  final Function deleteTripActivity;

  // Unused random colors for activity cards
  Color getColor() {
    const colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  const TripActivityCard({ super.key, required this.activity, required this.deleteTripActivity });

  @override
  State<TripActivityCard> createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  late Color color;

  // Init with random colors activity cards
  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(
            widget.activity.name,
            style: Theme.of(context).textTheme.bodySmall),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Activité supprimée'),
                backgroundColor: Colors.redAccent,
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'Annuler',
                  textColor: Colors.white,
                  onPressed: () {
                    print('undo');
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
