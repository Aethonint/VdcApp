import 'package:flutter/material.dart';
import '../Screens/Home_page/Home_menu.dart';
import '../Screens/Previous_checks_page/prev_checks.dart';
import '../Widgets/bottom_nav.dart';

// Import the sub-pages so they can be part of the navigation routes
import '../Screens/Home_page/daily_defect.dart';
import '../Screens/Home_page/incident_report.dart';

// A key to access the inner navigator
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class MainNavigation extends StatefulWidget {
  final int initialIndex;
  const MainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    // If the user taps the currently selected tab, pop to root
    if (_selectedIndex == index) {
      _navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildOffstageNavigator(int tabIndex) {
    final Map<String, WidgetBuilder> routeBuilders = {
      '/': (context) {
        switch (tabIndex) {
          case 0:
            return HomeScreen(onViewAllTapped: () => _onNavBarTap(1));
          case 1:
            return PreviousChecksScreen(
              onBackPressed: () => _onNavBarTap(0), // Go back to Home tab
            );
          default:
            return Container();
        }
      },
      '/daily_defect': (context) => const DailyDefectCheckScreen(),
      '/incident_report': (context) => const IncidentReportScreen(),
    };

    return Offstage(
      offstage: _selectedIndex != tabIndex,
      child: Navigator(
        key: tabIndex == 0 ? _navigatorKey : null, // Only home tab has global key
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[settings.name]!(context),
            settings: settings,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0), // Home Tab
          _buildOffstageNavigator(1), // Previous Checks Tab
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}
