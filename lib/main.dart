import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import 'workout_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutImplAdapter());
  await Hive.openBox('workouts');
  runApp(const WorkoutApp());
}
