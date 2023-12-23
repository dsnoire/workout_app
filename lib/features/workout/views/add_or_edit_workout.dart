import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_app/common/constants/app_colors.dart';
import 'package:workout_app/features/common/widgets/action_button.dart';

import 'package:workout_app/features/workout/enums/workout_schedule_enum.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import '../../../common/constants/app_dimens.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../cubits/workout_cubit/workout_cubit.dart';
import '../widgets/color_picker.dart';
import '../widgets/weekdays_picker.dart';
import '../widgets/workout_schedule_picker.dart';

class AddOrEditWorkout extends StatefulWidget {
  const AddOrEditWorkout({
    Key? key,
    this.workout,
  }) : super(key: key);

  final Workout? workout;

  @override
  State<AddOrEditWorkout> createState() => _AddOrEditWorkoutState();
}

class _AddOrEditWorkoutState extends State<AddOrEditWorkout> {
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
        const Color(0xFFDF4F45).value: false,
        const Color(0xFF44A3F1).value: false,
        const Color(0xFF8A8700).value: false,
        const Color(0xFF4BA54E).value: false,
        const Color(0xFF7850BE).value: false,
        const Color(0xFFB18646).value: false,
        const Color(0xFFB52BEC).value: false,
        const Color(0xFFDBA400).value: false,
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
                    createdAt: DateTime.timestamp());
                await context.read<WorkoutCubit>().addWorkout(
                      workout: workout,
                      id: workout.id,
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            )
          ]
        : [
            ActionButton(
              text: 'Remove',
              background: AppColors.warningColor,
              onPressed: () async {
                await context.read<WorkoutCubit>().removeWorkout(
                      id: widget.workout!.id,
                    );

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
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
                  Navigator.of(context).pop();
                }
              },
            )
          ];
  }
}
