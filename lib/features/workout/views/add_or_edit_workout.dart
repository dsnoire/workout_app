import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_app/core/constants/app_colors.dart';
import 'package:workout_app/features/common/widgets/action_button.dart';

import 'package:workout_app/features/workout/enums/workout_schedule_enum.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import '../../../core/constants/app_dimens.dart';
import '../../common/widgets/custom_app_bar.dart';
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
  late Map<int, bool> workoutColors;
  late Map<String, bool> weekdays;

  @override
  void initState() {
    if (widget.workout != null) {
      schedule = widget.workout!.schedule;
      weekdays = Map.from(widget.workout!.weekdays);
      workoutColors = Map.from(widget.workout!.color);
    } else {
      schedule = WorkoutScheduleEnum.fullBodyWorkout;
      weekdays = {
        'Monday': false,
        'Tuesday': false,
        'Wednesday': false,
        'Thursday': false,
        'Friday': false,
        'Saturday': false,
        'Sunday': false,
      };
      workoutColors = {
        AppColors.primaryColor.value: true,
        const Color(0xFFF94144).value: false,
        const Color(0xFFF3722C).value: false,
        const Color(0xFFF8961E).value: false,
        const Color(0xFFF9844A).value: false,
        const Color(0xFFF9C74F).value: false,
        const Color(0xFF90BE6D).value: false,
        const Color(0xFF43AA8B).value: false,
        const Color(0xFF4D908E).value: false,
        const Color(0xFF577590).value: false,
        const Color(0xFF277DA1).value: false,
        const Color(0xFFD2B7E5).value: false,
        const Color(0xFFB185DB).value: false,
        const Color(0xFF6247AA).value: false,
      };
    }
    nameController = TextEditingController(text: widget.workout?.name);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: _buildAppBarActions(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.sizeXL),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
              maxLength: 30,
            ),
            ColorPicker(workoutColors: workoutColors),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(thickness: 0.3),
            ),
            WorkoutSchedulePicker(
              schedule: schedule,
              onChanged: (WorkoutScheduleEnum? value) {
                setState(() {
                  schedule = value!;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(thickness: 0.3),
            ),
            WeekdaysPicker(weekdays: weekdays),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(thickness: 0.3),
            ),
          ],
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
                  color: workoutColors,
                  createdAt: DateTime.timestamp(),
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
              background: AppColors.warningColor,
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
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white.withAlpha(150),
                            ),
                          ),
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
                  color: workoutColors,
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
