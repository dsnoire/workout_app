import 'package:flutter/material.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';

import '../models/workout.dart';

const weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            workout.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            workout.schedule.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            7,
            (index) => Column(
              children: [
                Text(
                  weekdays[index].split('').getRange(0, 3).join(),
                ),
                const SizedBox(height: 5),
                CircleAvatar(
                  backgroundColor: index % 2 == 0
                      ? const Color.fromARGB(255, 0, 102, 185)
                      : const Color(0xFF242424),
                  child: Text(
                    index.toString(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
