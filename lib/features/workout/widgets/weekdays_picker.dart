import 'package:flutter/material.dart';
import 'package:workout_app/features/workout/extensions/weekday_abbreviation.dart';

import '../../../common/constants/app_colors.dart';

class WeekdaysPicker extends StatefulWidget {
  WeekdaysPicker({
    super.key,
    required this.weekdays,
  });

  Map<String, bool> weekdays;

  @override
  State<WeekdaysPicker> createState() => _WeekdaysPickerState();
}

class _WeekdaysPickerState extends State<WeekdaysPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Weekdays',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            widget.weekdays.length,
            (index) {
              final isSelected = widget.weekdays.values.elementAt(index);
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      widget.weekdays.update(
                        widget.weekdays.keys.elementAt(index),
                        (value) {
                          return !value;
                        },
                      );
                      print(widget.weekdays);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isSelected ? Colors.white : AppColors.contrastColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.weekdays.keys.getWeekdayAbbreviation(index: index),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.unselectedGreyColor,
                        ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}