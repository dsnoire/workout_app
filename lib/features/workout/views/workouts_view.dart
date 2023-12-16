import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_dimens.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.sizeXL),
      child: Column(
        children: [
          Container(),
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
