import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      onTap: () => context.push(
        '/edit-workout',
        extra: workout,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              workout.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              workout.schedule.name,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelSmall,
            ),
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
                backgroundColor:
                    isSelected == true ? Color(color) : const Color(0xFF131313),
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
