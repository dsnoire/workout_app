import 'package:workout_app/features/exercise/models/exercise.dart';

abstract class ExerciseRepository {
  List<Exercise> get getExercises;
  void addExercise({required Exercise exercise});
  void editExercise({required Exercise exercise, required String id});
  void removeExercise({required String id});
  void removeAllExercises();
}
