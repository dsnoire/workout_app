import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_app/core/constants/app_colors.dart';
import 'package:workout_app/features/common/widgets/action_button.dart';
import 'package:workout_app/features/exercise/models/exercise.dart';
import 'package:workout_app/features/workout/enums/workout_schedule_enum.dart';
import 'package:workout_app/features/workout/models/workout.dart';
import 'package:workout_app/features/workout/utils/workout_colors.dart';
import 'package:workout_app/features/workout/utils/workout_weekdays.dart';

import '../../../core/constants/app_dimens.dart';
import '../cubits/workout_cubit/workout_cubit.dart';
import '../widgets/color_picker.dart';
import '../widgets/weekdays_picker.dart';
import '../widgets/workout_schedule_picker.dart';

class AddOrEditWorkoutView extends StatefulWidget {
  const AddOrEditWorkoutView({
    Key? key,
    this.workout,
  }) : super(key: key);

  final Workout? workout;

  @override
  State<AddOrEditWorkoutView> createState() => _AddOrEditWorkoutViewState();
}

class _AddOrEditWorkoutViewState extends State<AddOrEditWorkoutView> {
  late final TextEditingController nameController;
  late WorkoutScheduleEnum schedule;
  late Map<int, bool> colors;
  late Map<String, bool> weekdays;

  @override
  void initState() {
    _initializeValues();
    nameController = TextEditingController(text: widget.workout?.name);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _initializeValues() {
    schedule = widget.workout?.schedule ?? WorkoutScheduleEnum.fullBodyWorkout;
    weekdays = Map.from(widget.workout?.weekdays ?? workoutWeekdays);
    colors = Map.from(widget.workout?.color ?? workoutColors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout == null ? 'New Workout' : ''),
        actions: _buildAppBarActions(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.layoutHorizontal,
          vertical: AppDimens.layoutVertical,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                maxLength: 30,
              ),
              const SizedBox(height: 16),
              ColorPicker(workoutColors: colors),
              const SizedBox(height: 32),
              WorkoutSchedulePicker(
                schedule: schedule,
                onChanged: (WorkoutScheduleEnum? value) {
                  setState(() {
                    schedule = value!;
                  });
                },
              ),
              const SizedBox(height: 40),
              WeekdaysPicker(weekdays: weekdays),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return widget.workout == null
        ? [
            ActionButton(
              text: 'Done',
              onPressed: () async {
                final workout = Workout(
                  id: const Uuid().v4(),
                  name: nameController.text,
                  schedule: schedule,
                  weekdays: weekdays,
                  color: colors,
                  createdAt: DateTime.timestamp(),
                  exercises: [
                    Exercise(id: '3', name: 'Test 1'),
                  ],
                );
                await context.read<WorkoutCubit>().addWorkout(
                      workout: workout,
                      id: workout.id,
                    );
                if (context.mounted) {
                  context.pop();
                }
              },
            )
          ]
        : [
            ActionButton(
              text: 'Remove',
              color: AppColors.warningColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Remove workout'),
                      content: const Text(
                          'Are you sure you want to permanently remove workout?'),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await context.read<WorkoutCubit>().removeWorkout(
                                  id: widget.workout!.id,
                                );
                            if (context.mounted) {
                              context.go('/workouts');
                            }
                          },
                          child: const Text('Ok'),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            ActionButton(
              text: 'Done',
              onPressed: () async {
                final workout = widget.workout!.copyWith(
                  name: nameController.text,
                  schedule: schedule,
                  weekdays: weekdays,
                  color: colors,
                );
                await context.read<WorkoutCubit>().editWorkout(
                      workout: workout,
                      id: workout.id,
                    );
                if (context.mounted) {
                  context.pop();
                }
              },
            )
          ];
  }
}
