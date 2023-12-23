import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_colors.dart';
import 'package:workout_app/features/workout/extensions/weekday_abbreviation.dart';
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            workout.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            workout.schedule.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            workout.weekdays.length,
            (index) {
              final isSelected = workout.weekdays.values.elementAt(index);
              final color = workout.color.entries
                  .firstWhere((element) => element.value == true)
                  .key;
              return CircleAvatar(
                backgroundColor: isSelected == true
                    ? Color(color)
                    : const Color.fromARGB(255, 22, 22, 22),
                child: Text(
                  workout.weekdays.keys.getWeekdayAbbreviation(index: index),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
