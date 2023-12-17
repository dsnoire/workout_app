part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.loaded({required List<Workout> workouts}) =
      _Loaded;
  const factory WorkoutState.empty() = _Empty;
  const factory WorkoutState.error(String message) = _Error;
}
