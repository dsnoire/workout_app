// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/features/exercise/utils/muscle_groups.dart';

import '../../../core/constants/app_colors.dart';

class MuscleGroupsBottomSheet extends StatefulWidget {
  const MuscleGroupsBottomSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MuscleGroupsBottomSheet> createState() =>
      _MuscleGroupsBottomSheetState();
}

class _MuscleGroupsBottomSheetState extends State<MuscleGroupsBottomSheet> {
  @override
  void dispose() {
    muscleGroups.updateAll((key, value) => false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkerContrastColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Done'),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                itemCount: muscleGroups.keys.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Row(
                    children: [
                      Checkbox(
                        value: muscleGroups.values.elementAt(index),
                        onChanged: (newValue) {
                          setState(() {
                            muscleGroups.update(
                                muscleGroups.keys.elementAt(index),
                                (value) => newValue!);
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      Text(
                        muscleGroups.keys.elementAt(index),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
