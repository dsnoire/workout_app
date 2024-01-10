import 'package:flutter/material.dart';
import 'package:workout_app/core/di/di.dart';
import 'package:workout_app/core/router/app_router.dart';
import 'package:workout_app/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/workout/cubits/workout_cubit/workout_cubit.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutCubit>(
          create: (context) => getIt<WorkoutCubit>()..getWorkouts(),
        ),
        // BlocProvider<ExerciseCubit>(
        //   create: (context) =>
        //       ExerciseCubit(ExerciseRepositoryImpl())..getExercises(),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Workout App',
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
