import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:workout_app/features/workout/models/workout.dart';
import 'package:workout_app/features/workout/repositories/workout_repository.dart';

@Injectable(as: WorkoutRepository)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final _box = Hive.box('workouts');

  @override
  List<Workout> get getWorkouts => _box.values.toList().cast<Workout>()
    ..sort(
      (b, a) => a.createdAt.compareTo(b.createdAt),
    );

  @override
  Future<void> addWorkout({
    required Workout workout,
    required String id,
  }) async =>
      await _box.put(
        id,
        workout,
      );

  @override
  Future<void> editWorkout({
    required Workout workout,
    required String id,
  }) async =>
      _box.put(
        id,
        workout,
      );

  @override
  Future<void> removeWorkout({required String id}) async => _box.delete(id);

  @override
  Future<void> removeAllWorkouts() async => await _box.deleteAll(_box.keys);
}
