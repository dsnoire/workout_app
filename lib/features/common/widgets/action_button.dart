import 'package:flutter/material.dart';
import 'package:workout_app/core/constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color ?? AppColors.primaryColor,
            ),
      ),
    );
  }
}
