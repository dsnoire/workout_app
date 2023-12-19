import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.actions,
  }) : super(key: key);
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.keyboard_arrow_left),
      ),
      actions: actions
          ?.map(
            (action) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: action,
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
