import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_dimens.dart';
import '../models/workout.dart';
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
      appBar: AppBar(title: Text(workout.name)),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.layoutHorizontal,
          vertical: AppDimens.layoutVertical,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder<ExerciseCubit, ExerciseState>(
            //   builder: (context, state) {
            //     return state.when(
            //       loaded: (exercises) => ListView.separated(
            //         shrinkWrap: true,
            //         itemCount: exercises.length,
            //         separatorBuilder: (_, __) => const SizedBox(height: 16),
            //         itemBuilder: (BuildContext context, int index) {
            //           return ListTile(
            //             leading: Text(
            //               '${index + 1}',
            //               style: Theme.of(context).textTheme.labelMedium,
            //             ),
            //             title: Text(exercises[index].name),
            //           );
            //         },
            //       ),
            //       empty: () {
            //         print('no exercises');
            //         return const Center(
            //           child: Text('No exercises'),
            //         );
            //       },
            //       error: () => const Center(
            //         child: Text('123'),
            //       ),
            //     );
            //   },
            // ),
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
              onPressed: () => context.push(
                '/add-exercise',
                extra: workout,
              ),
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
