// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/features/common/widgets/custom_app_bar.dart';

import '../widgets/sets_text_field.dart';

class AddExerciseView extends StatelessWidget {
  const AddExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add exercise',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          children: [
            const TextField(
                decoration: InputDecoration(hintText: 'Exercise name')),
            const SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
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
                      const Text('Rest time between sets'),
                      Switch(
                        value: true,
                        onChanged: (bool newValue) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.ms,
                    onTimerDurationChanged: (Duration newDuration) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
