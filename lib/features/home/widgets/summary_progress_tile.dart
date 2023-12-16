import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_colors.dart';

class SummaryProgressTile extends StatelessWidget {
  const SummaryProgressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.contrastColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
