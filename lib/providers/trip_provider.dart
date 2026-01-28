import 'dart:collection';

import 'package:flutter/widgets.dart';
import '../data/data.dart' as data;
import '../models/trip_model.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);
}