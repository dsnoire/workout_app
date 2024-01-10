part of 'exercise_cubit.dart';

@freezed
class ExerciseState with _$ExerciseState {
  const factory ExerciseState.loaded({required List<Exercise> exercises}) =
      _Loaded;
  const factory ExerciseState.empty() = _Empty;
  const factory ExerciseState.error() = _Error;
}
