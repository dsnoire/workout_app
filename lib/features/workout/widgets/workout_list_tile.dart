import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/core/constants/app_colors.dart';
import 'package:workout_app/features/workout/cubits/workout_cubit/workout_cubit.dart';
import 'package:workout_app/features/workout/enums/workout_popupmenu_action_enum.dart';
import 'package:workout_app/features/workout/extensions/weekday_abbreviation.dart';

import '../models/workout.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/workout',
        extra: workout,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.contrastColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workout.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                PopupMenuButton<WorkoutPopupMenuActionEnum>(
                  iconSize: 19,
                  color: AppColors.darkerContrastColor,
                  elevation: 0,
                  onSelected: (WorkoutPopupMenuActionEnum action) async {
                    if (action == WorkoutPopupMenuActionEnum.edit) {
                      context.push(
                        '/edit-workout',
                        extra: workout,
                      );
                    } else if (action == WorkoutPopupMenuActionEnum.remove) {
                      await context
                          .read<WorkoutCubit>()
                          .removeWorkout(id: workout.id);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<WorkoutPopupMenuActionEnum>>[
                      const PopupMenuItem<WorkoutPopupMenuActionEnum>(
                        value: WorkoutPopupMenuActionEnum.edit,
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 9),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem<WorkoutPopupMenuActionEnum>(
                        value: WorkoutPopupMenuActionEnum.remove,
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 9),
                            Text('Remove'),
                          ],
                        ),
                      ),
                    ];
                  },
                )
              ],
            ),
            Text(
              workout.schedule.name,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 16),
            Row(
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
                        : AppColors.darkerContrastColor,
                    child: Text(
                      workout.weekdays.keys
                          .getWeekdayAbbreviation(index: index),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: isSelected ? FontWeight.bold : null,
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
