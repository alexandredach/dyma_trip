import 'package:flutter/material.dart';
import '../data/data.dart' as data;
import '../models/activity_model.dart';

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }
}