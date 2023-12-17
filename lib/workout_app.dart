import 'package:flutter/material.dart';
import 'package:workout_app/common/theme/app_theme.dart';
import 'package:workout_app/common/views/root_view.dart';
import 'package:workout_app/features/workout/cubits/cubit/workout_cubit.dart';
import 'package:workout_app/features/workout/repositories/workout_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/features/workout/views/workouts_view.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              WorkoutCubit(WorkoutRepositoryImpl())..getWorkouts(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workout App',
        theme: AppTheme.theme,
        home: const RootView(),
      ),
    );
  }
}
