import 'package:flutter/material.dart';

class SetsTextField extends StatelessWidget {
  const SetsTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
