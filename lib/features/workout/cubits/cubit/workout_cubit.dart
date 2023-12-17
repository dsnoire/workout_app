import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_app/features/workout/repositories/workout_repository.dart';

import '../../models/workout.dart';

part 'workout_state.dart';
part 'workout_cubit.freezed.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this.workoutRepository)
      : super(
          const WorkoutState.loaded(
            workouts: [],
          ),
        );
  final WorkoutRepository workoutRepository;

  void getWorkouts() {
    final workouts = workoutRepository.getWorkouts;
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
      await workoutRepository.addWorkout(
        workout: workout,
        id: id,
      );
      final workouts = workoutRepository.getWorkouts;
      emit(WorkoutState.loaded(workouts: workouts));
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
      await workoutRepository.editWorkout(
        workout: workout,
        id: id,
      );
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
      await workoutRepository.removeWorkout(id: id);
    } catch (e) {
      emit(
        WorkoutState.error(
          e.toString(),
        ),
      );
    }
  }
}
