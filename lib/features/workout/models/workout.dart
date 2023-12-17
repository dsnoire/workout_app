import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'workout.freezed.dart';

part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  @HiveType(typeId: 0)
  const factory Workout({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String schedule,
  }) = _Workout;
}
