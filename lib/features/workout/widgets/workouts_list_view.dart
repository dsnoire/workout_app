import 'package:flutter/widgets.dart';

import '../models/workout.dart';
import 'workout_list_tile.dart';

class WorkoutsListView extends StatelessWidget {
  const WorkoutsListView({
    Key? key,
    required this.workouts,
  }) : super(key: key);

  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: workouts.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        print(workouts);
        return WorkoutListTile(workout: workouts[index]);
      },
    );
  }
}
