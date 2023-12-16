import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_colors.dart';
import 'package:workout_app/common/constants/app_dimens.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.sizeXL),
      child: Column(
        children: [
          Container(),
          const Spacer(),
          MaterialButton(
            onPressed: () {},
            color: AppColors.primaryColor,
            padding: const EdgeInsets.all(24),
            shape: const StadiumBorder(),
            child: const Text('New Workout'),
          ),
        ],
      ),
    );
  }
}
