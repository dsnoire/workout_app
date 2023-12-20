import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:workout_app/features/workout/enums/workout_schedule_enum.dart';

part 'workout.freezed.dart';

part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  @HiveType(typeId: 0)
  factory Workout({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required WorkoutScheduleEnum schedule,
    @HiveField(3) required Map<String, bool> weekdays,
  }) = _Workout;
}
