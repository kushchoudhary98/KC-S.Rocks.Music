import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_rocks_music/utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  final List<_NavItem> items = [
    _NavItem('assets/icons/navBar/home.svg', 'Home'),
    _NavItem('assets/icons/navBar/news.svg', 'News'),
    _NavItem('assets/icons/navBar/trackbox.svg', 'TrackBox'),
    _NavItem('assets/icons/navBar/projects.svg', 'Projects'),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border(
            top: BorderSide(color: kprimaryBackgroundColor, width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isSelected = index == currentIndex;
            final item = items[index];

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => onTap(index),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Animated semicircle bump
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 150),
                      top: isSelected ? -10 : -20,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Icon + Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 2),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: SvgPicture.asset(
                            item.iconPath,
                            key: ValueKey<bool>(isSelected),
                            color: isSelected ? Colors.white : Colors.grey,
                            width: 26,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 12,
                          ),
                          child: Text(item.label),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final String iconPath;
  final String label;

  _NavItem(this.iconPath, this.label);
}


// bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//       ),







