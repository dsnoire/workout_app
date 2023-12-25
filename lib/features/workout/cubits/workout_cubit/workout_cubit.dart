import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workout_app/features/workout/repositories/workout_repository.dart';

import '../../models/workout.dart';

part 'workout_state.dart';
part 'workout_cubit.freezed.dart';

@injectable
class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this._workoutRepository)
      : super(
          const WorkoutState.loaded(
            workouts: [],
          ),
        );
  final WorkoutRepository _workoutRepository;

  void getWorkouts() {
    final workouts = _workoutRepository.getWorkouts;
    if (workouts.isEmpty) {
      emit(const WorkoutState.empty());
    } else {
      emit(
        WorkoutState.loaded(workouts: workouts),
      );
    }
  }

  Future<void> addWorkout({
    required Workout workout,
    required String id,
  }) async {
    emit(const WorkoutState.loading());
    try {
      await _workoutRepository.addWorkout(
        workout: workout,
        id: id,
      );
      getWorkouts();
    } catch (e) {
      emit(
        WorkoutState.error(
          e.toString(),
        ),
      );
    }
  }

  Future<void> editWorkout({
    required Workout workout,
    required String id,
  }) async {
    emit(const WorkoutState.loading());
    try {
      await _workoutRepository.editWorkout(
        workout: workout,
        id: id,
      );
      getWorkouts();
    } catch (e) {
      emit(
        WorkoutState.error(
          e.toString(),
        ),
      );
    }
  }

  Future<void> removeWorkout({required String id}) async {
    emit(const WorkoutState.loading());
    try {
      await _workoutRepository.removeWorkout(id: id);
      getWorkouts();
    } catch (e) {
      emit(
        WorkoutState.error(
          e.toString(),
        ),
      );
    }
  }
}
