import 'package:flutter/material.dart';
import 'package:workout_app/common/di/di.dart';
import 'package:workout_app/common/theme/app_theme.dart';
import 'package:workout_app/common/views/root_view.dart';
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
