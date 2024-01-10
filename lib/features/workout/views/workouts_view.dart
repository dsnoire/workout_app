// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:workout_app/core/constants/app_dimens.dart';
import 'package:workout_app/features/common/widgets/custom_app_bar.dart';
import '../cubits/workout_cubit/workout_cubit.dart';
import '../widgets/workouts_list_view.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Remove all workouts'),
                    content: const Text(
                        'Are you sure you want to remove all the workouts?'),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await context
                              .read<WorkoutCubit>()
                              .removeAllWorkouts();
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.layoutHorizontal,
          vertical: AppDimens.layoutVertical,
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
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'New workout',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          context.push('/add-workout');
        },
      ),
    );
  }
}
