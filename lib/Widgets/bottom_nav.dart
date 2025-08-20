import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), 
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 1, 59, 107),
          type: BottomNavigationBarType.fixed,
          iconSize: 32, 
          selectedFontSize: 14, 
          unselectedFontSize: 13, 
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(179, 255, 255, 255),
          currentIndex: currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined),
              label: 'Prev checks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Ancillary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
