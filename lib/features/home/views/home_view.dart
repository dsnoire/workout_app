import 'package:flutter/material.dart';
import 'package:workout_app/core/constants/app_dimens.dart';
import 'package:workout_app/features/home/widgets/summary_progress_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunday, 10 Dec'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.layoutHorizontal,
          vertical: AppDimens.layoutVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SummaryProgressTile(),
                SummaryProgressTile(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SummaryProgressTile(),
                SummaryProgressTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
