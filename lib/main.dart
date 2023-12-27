import 'package:flutter/material.dart';
import 'package:workout_app/core/di/di.dart';
import 'package:workout_app/core/hive/hive_init.dart';

import 'workout_app.dart';

void main() async {
  await hiveInit();
  configureDependencies();
  runApp(const WorkoutApp());
}
