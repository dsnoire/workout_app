import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/core/constants/app_colors.dart';

import 'package:workout_app/features/common/widgets/custom_app_bar.dart';

import '../widgets/muscle_groups_bottom_sheet.dart';
import '../widgets/sets_text_field.dart';

class AddExerciseView extends StatefulWidget {
  const AddExerciseView({super.key});

  @override
  State<AddExerciseView> createState() => _AddExerciseViewState();
}

class _AddExerciseViewState extends State<AddExerciseView> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add exercise',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(hintText: 'Exercise name'),
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
                  value
                      ? CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.ms,
                          onTimerDurationChanged: (Duration newDuration) {
                            print(newDuration);
                          },
                        )
                      : const SizedBox(),
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
