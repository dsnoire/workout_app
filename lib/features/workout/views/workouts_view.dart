import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/common/constants/app_dimens.dart';
import 'package:workout_app/features/workout/cubits/cubit/workout_cubit.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.sizeXL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (workouts) => ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: workouts.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    print(workouts);
                    return ListTile(
                      tileColor: Colors.red,
                      leading: Text(workouts[index].name),
                    );
                  },
                ),
                empty: () => const Center(child: Text('No workouts')),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
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
