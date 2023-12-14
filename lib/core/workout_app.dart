import 'package:flutter/material.dart';
import 'package:workout_app/common/theme/app_theme.dart';

import '../features/home/views/home_view.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: AppTheme.theme,
      home: const HomeView(),
    );
  }
}
