import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/features/exercise/models/exercise.dart';

import '../../features/workout/enums/workout_schedule_enum.dart';
import '../../features/workout/models/workout.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutImplAdapter());
  Hive.registerAdapter(WorkoutScheduleEnumAdapter());
  Hive.registerAdapter(ExerciseImplAdapter());
  await Hive.openBox('workouts');
}
