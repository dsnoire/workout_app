import 'package:hive/hive.dart';
part 'workout_schedule_enum.g.dart';

@HiveType(typeId: 1)
enum WorkoutScheduleEnum {
  @HiveField(0)
  fullBodyWorkout('Full Body'),
  @HiveField(1)
  pushPullLegs('Push Pull Legs'),
  @HiveField(2)
  upperLower('Upper Lower'),
  @HiveField(3)
  split('Split');

  const WorkoutScheduleEnum(this.name);
  final String name;
}
