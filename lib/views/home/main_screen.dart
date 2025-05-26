import 'package:flutter/material.dart';
import 'package:s_rocks_music/utils/constants.dart';
import 'package:s_rocks_music/views/home/home_screen.dart';
import 'package:s_rocks_music/views/home/news_screen.dart';
import 'package:s_rocks_music/views/home/projects_screen.dart';
import 'package:s_rocks_music/views/home/track_box_screen.dart';
import 'package:s_rocks_music/widgets/custom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    NewsScreen(),
    TrackBoxScreen(),
    ProjectsScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      backgroundColor: kprimaryColor,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
