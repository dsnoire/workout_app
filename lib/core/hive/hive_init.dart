import 'package:hive_flutter/hive_flutter.dart';

import '../../features/workout/enums/workout_schedule_enum.dart';
import '../../features/workout/models/workout.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutImplAdapter());
  Hive.registerAdapter(WorkoutScheduleEnumAdapter());
  await Hive.openBox('workouts');
}
