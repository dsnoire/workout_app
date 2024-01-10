// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_app/core/constants/app_dimens.dart';
import 'package:workout_app/features/common/widgets/action_button.dart';
import 'package:workout_app/features/exercise/cubits/exercise_cubit/exercise_cubit.dart';
import 'package:workout_app/features/exercise/models/exercise.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import '../widgets/muscle_groups_bottom_sheet.dart';
import '../widgets/sets_text_field.dart';

class AddExerciseView extends StatefulWidget {
  const AddExerciseView({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  @override
  State<AddExerciseView> createState() => _AddExerciseViewState();
}

class _AddExerciseViewState extends State<AddExerciseView> {
  late final TextEditingController nameController;
  bool value = false;

  @override
  void initState() {
    nameController = TextEditingController();
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
      appBar: AppBar(
        title: const Text('Add exercise'),
        actions: [
          ActionButton(
            onPressed: () {
              final exercise = Exercise(
                id: const Uuid().v4(),
                name: nameController.text,
              );
              context.read<ExerciseCubit>().addExercise(
                    exercise: exercise,
                    id: widget.workout.id,
                  );
              print(Hive.box('workouts').values);
              context.pop();
            },
            text: 'Done',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.layoutHorizontal,
          vertical: AppDimens.layoutVertical,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Exercise name'),
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Text(
                    'Sets',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SetsTextField(label: 'Sets'),
                      SetsTextField(label: 'Reps'),
                      SetsTextField(label: 'RIR')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rest time between sets',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Switch(
                        value: value,
                        onChanged: (bool newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  if (value)
                    CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.ms,
                      onTimerDurationChanged: (Duration newDuration) {
                        print(newDuration);
                      },
                    ),
                  const SizedBox(height: 24),
                  ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const MuscleGroupsBottomSheet(
                          title: 'Major muscle groups',
                        );
                      },
                    ),
                    leading: const Icon(Icons.person_add),
                    title: Text(
                      'Major muscle groups',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      'Biceps, back',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const MuscleGroupsBottomSheet(
                          title: 'Supported muscle groups',
                        );
                      },
                    ),
                    leading: const Icon(Icons.person_add_outlined),
                    title: Text(
                      'Supported muscle groups',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      '-',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
