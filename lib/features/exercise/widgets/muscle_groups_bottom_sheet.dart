// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class MuscleGroupsBottomSheet extends StatelessWidget {
  const MuscleGroupsBottomSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkerContrastColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Done'),
                ),
              ],
            ),
            ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (x) {},
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Biceps',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
