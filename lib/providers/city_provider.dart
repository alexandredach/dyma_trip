import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../data/data.dart' as data;
import '../models/city_model.dart';

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);
}