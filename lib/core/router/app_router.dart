import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/features/common/views/root_view.dart';
import 'package:workout_app/features/exercise/views/add_exercise_view.dart';
import 'package:workout_app/features/home/views/home_view.dart';
import 'package:workout_app/features/statistics/views/statistics_view.dart';
import 'package:workout_app/features/workout/models/workout.dart';
import 'package:workout_app/features/workout/views/add_or_edit_workout.dart';
import 'package:workout_app/features/workout/views/workout_view.dart';
import 'package:workout_app/features/workout/views/workouts_view.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/edit-workout',
        builder: (context, state) => AddOrEditWorkoutView(
          workout: state.extra as Workout,
        ),
      ),
      GoRoute(
        path: '/add-workout',
        builder: (context, state) => const AddOrEditWorkoutView(),
      ),
      GoRoute(
        path: '/workout',
        builder: (context, state) => WorkoutView(
          workout: state.extra as Workout,
        ),
      ),
      GoRoute(
          path: '/add-exercise',
          builder: (context, state) => const AddExerciseView()),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (
          context,
          state,
          child,
        ) =>
            RootView(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeView(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/workouts',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: WorkoutsView(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/statistics',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: StatisticsView(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
