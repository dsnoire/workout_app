// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:workout_app/features/exercise/repositories/exercise_repository.dart';

import '../../models/exercise.dart';

part 'exercise_cubit.freezed.dart';
part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit(
    this._exerciseRepository,
  ) : super(const ExerciseState.loaded(exercises: []));

  final ExerciseRepository _exerciseRepository;

  void getExercises() {
    final exercises = _exerciseRepository.getExercises;
    if (exercises.isEmpty) {
      emit(const ExerciseState.empty());
    } else {
      emit(ExerciseState.loaded(exercises: exercises));
    }
  }

  void addExercise({required Exercise exercise, required String id}) {
    final exercises = _exerciseRepository.getExercises;
    _exerciseRepository.addExercise(exercise: exercise);
    emit(ExerciseState.loaded(exercises: exercises));
  }
}
