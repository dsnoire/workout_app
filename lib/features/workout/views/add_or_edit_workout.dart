import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_colors.dart';

import '../../../common/constants/app_dimens.dart';

const List<String> list = <String>[
  'Full Body Workout',
  'Push Pull Legs',
  'Upper Lower',
  'Split'
];

class AddOrEditWorkout extends StatefulWidget {
  const AddOrEditWorkout({super.key});

  @override
  State<AddOrEditWorkout> createState() => _AddOrEditWorkoutState();
}

class _AddOrEditWorkoutState extends State<AddOrEditWorkout> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Done'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.sizeXL),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  height: -0.2,
                ),
              ),
              maxLength: 50,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.unselectedGreyColor,
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: DropdownButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                dropdownColor: AppColors.primaryColor,
                value: dropdownValue,
                items: list.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Center(child: Text(e)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(
                    () {
                      dropdownValue = value!;
                    },
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
