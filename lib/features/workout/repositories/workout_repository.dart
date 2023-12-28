import 'package:workout_app/features/workout/models/workout.dart';

abstract class WorkoutRepository {
  List<Workout> get getWorkouts;
  Future<void> addWorkout({required Workout workout, required String id});
  Future<void> editWorkout({required Workout workout, required String id});
  Future<void> removeWorkout({required String id});
  Future<void> removeAllWorkouts();
}
