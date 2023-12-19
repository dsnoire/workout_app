// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:workout_app/common/constants/app_dimens.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

import '../cubits/workout_cubit/workout_cubit.dart';
import '../widgets/workouts_list_view.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.sizeXL,
        vertical: 32,
      ),
      child: Column(
        children: [
          BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (workouts) => WorkoutsListView(workouts: workouts),
                empty: () => const Center(child: Text('No workouts')),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddOrEditWorkout(),
                ),
              );
            },
            child: const Text('New Workout'),
          )
        ],
      ),
    );
  }
}
