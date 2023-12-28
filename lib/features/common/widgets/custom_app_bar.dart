// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.actions,
    this.title,
  }) : super(key: key);
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
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
