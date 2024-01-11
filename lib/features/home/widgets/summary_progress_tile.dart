// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:workout_app/core/constants/app_colors.dart';
import 'chart_indicator.dart';

class SummaryProgressTile extends StatelessWidget {
  const SummaryProgressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFF0C0C0C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly progress',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Row(
                children: [
                  ChartIndicator(
                    color: AppColors.primaryColor,
                    text: 'Done',
                  ),
                  SizedBox(width: 8),
                  ChartIndicator(
                    color: AppColors.darkerContrastColor,
                    text: 'Pending',
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 60,
                      sections: [
                        PieChartSectionData(
                          color: AppColors.primaryColor,
                          value: 3,
                          radius: 30,
                          title: '3',
                        ),
                        PieChartSectionData(
                          color: AppColors.darkerContrastColor,
                          value: 2,
                          radius: 30,
                          title: '2',
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3 of 5 workouts',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '60%',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
