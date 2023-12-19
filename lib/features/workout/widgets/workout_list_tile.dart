import 'package:flutter/material.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

import '../models/workout.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => AddOrEditWorkout(
            workout: workout,
          ),
        ),
      ),
      tileColor: Colors.red,
      leading: Text(workout.name),
      subtitle: Text(workout.schedule.name),
    );
  }
}
