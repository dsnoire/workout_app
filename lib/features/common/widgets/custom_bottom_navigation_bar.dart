import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import 'bottom_navigation_bar_item_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/workouts');
        break;
      case 2:
        context.go('/statistics');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
          _onTap(value);
        },
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/home_filled_icon.svg',
              color: Colors.white,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/home_icon.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/dumbbell_filled_icon.svg',
              color: Colors.white,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/dumbbell_icon.svg',
            ),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/chart_icon.svg',
              color: Colors.white,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/chart_icon.svg',
            ),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
