import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/core/constants/app_dimens.dart';

import 'package:workout_app/features/common/widgets/custom_app_bar.dart';
import 'package:workout_app/features/workout/models/workout.dart';

import '../../../core/constants/app_colors.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: workout.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.sizeXL,
          vertical: 32,
        ),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  title: const Text('XYZ'),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 200,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => context.push('/add-exercise'),
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
