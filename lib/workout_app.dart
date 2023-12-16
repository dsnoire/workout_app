import 'package:flutter/material.dart';
import 'package:workout_app/common/theme/app_theme.dart';
import 'package:workout_app/common/views/root_view.dart';

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout App',
      theme: AppTheme.theme,
      home: const RootView(),
    );
  }
}
