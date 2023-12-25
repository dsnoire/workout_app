import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.workoutColors,
  });

  final Map<int, bool> workoutColors;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.workoutColors.keys.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  widget.workoutColors.updateAll(
                    (key, value) {
                      if (widget.workoutColors.keys.elementAt(index) == key) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundColor:
                  Color(widget.workoutColors.keys.elementAt(index)),
              child: widget.workoutColors.values.elementAt(index)
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
      ),
    );
  }
}
