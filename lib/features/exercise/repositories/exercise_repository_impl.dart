import 'package:workout_app/features/exercise/models/exercise.dart';
import 'package:workout_app/features/exercise/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  @override
  List<Exercise> get getExercises => throw UnimplementedError();

  @override
  void addExercise({required Exercise exercise}) {}

  @override
  void editExercise({required Exercise exercise, required String id}) {}

  @override
  void removeExercise({required String id}) {}

  @override
  void removeAllExercises() {}
}
