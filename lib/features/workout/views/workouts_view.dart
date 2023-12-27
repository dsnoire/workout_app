// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:workout_app/core/constants/app_dimens.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

import '../../../core/constants/app_colors.dart';
import '../cubits/workout_cubit/workout_cubit.dart';
import '../widgets/workouts_list_view.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.sizeXL,
          vertical: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (workouts) => Expanded(
                    child: WorkoutsListView(workouts: workouts),
                  ),
                  empty: () => const Center(
                    child: Text('No workouts'),
                  ),
                  error: (message) => Center(
                    child: Text(message),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          context.push('/add-workout');
        },
      ),
    );
  }
}
