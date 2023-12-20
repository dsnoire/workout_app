// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:workout_app/common/constants/app_colors.dart';
import 'package:workout_app/features/home/views/home_view.dart';
import 'package:workout_app/features/statistics/views/statistics_view.dart';
import 'package:workout_app/features/workout/views/workouts_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int index = 0;

  final List<Widget> views = [
    const HomeView(),
    const WorkoutsView(),
    const StatisticsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              activeIcon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/home_filled_icon.svg',
                color: Colors.white,
              ),
              icon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/home_icon.svg',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/dumbbell_filled_icon.svg',
                color: Colors.white,
              ),
              icon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/dumbbell_icon.svg',
              ),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              activeIcon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/chart_icon.svg',
                color: Colors.white,
              ),
              icon: _BottomNavigationBarItemIcon(
                path: 'assets/icons/chart_icon.svg',
              ),
              label: 'Statistics',
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBarItemIcon extends StatelessWidget {
  const _BottomNavigationBarItemIcon({
    Key? key,
    required this.path,
    this.color,
  }) : super(key: key);

  final String path;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color ?? AppColors.unselectedGreyColor,
          BlendMode.srcIn,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
