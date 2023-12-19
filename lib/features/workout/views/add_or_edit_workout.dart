// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:workout_app/common/constants/app_colors.dart';
import 'package:workout_app/features/workout/enums/workout_schedule_enum.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import '../../../common/constants/app_dimens.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../cubits/workout_cubit/workout_cubit.dart';
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

  @override
  void initState() {
    if (widget.workout != null) {
      schedule = widget.workout!.schedule;
    } else {
      schedule = WorkoutScheduleEnum.fullBodyWorkout;
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
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  height: -0.2,
                ),
              ),
              maxLength: 50,
            ),
            WorkoutSchedulePicker(
              schedule: schedule,
              onChanged: (WorkoutScheduleEnum? value) {
                setState(() {
                  schedule = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return widget.workout == null
        ? [
            ElevatedButton(
              onPressed: () async {
                final workout = Workout(
                  id: const Uuid().v4(),
                  name: nameController.text,
                  schedule: schedule,
                );
                await context.read<WorkoutCubit>().addWorkout(
                      workout: workout,
                      id: workout.id,
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Done'),
            )
          ]
        : [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warningColor,
              ),
              onPressed: () async {
                await context.read<WorkoutCubit>().removeWorkout(
                      id: widget.workout!.id,
                    );

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Remove'),
            ),
            ElevatedButton(
              onPressed: () async {
                final workout = widget.workout!.copyWith(
                  name: nameController.text,
                  schedule: schedule,
                );
                await context.read<WorkoutCubit>().editWorkout(
                      workout: workout,
                      id: workout.id,
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Edit'),
            )
          ];
  }
}
