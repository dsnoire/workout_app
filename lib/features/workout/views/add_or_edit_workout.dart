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
  late Map<String, bool> weekdays;

  @override
  void initState() {
    if (widget.workout != null) {
      schedule = widget.workout!.schedule;
      weekdays = Map.from(widget.workout!.weekdays);
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
            SizedBox(
              height: 75,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CircleAvatar(
                    backgroundColor: index % 2 == 0 ? Colors.red : Colors.green,
                    child: const Icon(Icons.check),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemCount: 30,
              ),
            ),
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
                );
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
