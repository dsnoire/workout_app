import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class RootView extends StatefulWidget {
  const RootView({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
