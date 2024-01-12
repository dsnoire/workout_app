import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../enums/workout_schedule_enum.dart';

class WorkoutSchedulePicker extends StatelessWidget {
  const WorkoutSchedulePicker({
    Key? key,
    required this.schedule,
    required this.onChanged,
  }) : super(key: key);

  final WorkoutScheduleEnum schedule;
  final Function(WorkoutScheduleEnum?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Schedule',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.unselectedColor,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<WorkoutScheduleEnum>(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 5,
            ),
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            dropdownColor: AppColors.darkerContrastColor,
            value: schedule,
            items: WorkoutScheduleEnum.values.map(
              (workoutSchedule) {
                return DropdownMenuItem(
                  value: workoutSchedule,
                  child: Center(
                    child: Text(
                      workoutSchedule.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
