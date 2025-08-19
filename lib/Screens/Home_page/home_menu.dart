// lib/Screens/Home_page/Home_menu.dart

import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/Top_nav.dart';
import 'package:fleetedge/Widgets/Checks_card.dart';
import 'package:fleetedge/Widgets/home_menus.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onViewAllTapped;

  const HomeScreen({
    super.key,
    required this.onViewAllTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reusable Top Navigation Bar
            TopNavBar(
              title: "FleetEdge",
              onNotificationTap: () {
                // Handle notification tap here
              },
            ),

            const SizedBox(height: 25),

            // Last Check text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Last Check",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Daily Checks & Reports container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Daily Checks & Reports",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuButton(
                        icon: Icons.car_rental,
                        label: "Daily defect check",
                        onTap: () {
                          // Navigate to the sub-page using a named route
                          Navigator.pushNamed(context, '/daily_defect');
                        },
                      ),
                      MenuButton(
                        icon: Icons.warning_amber_rounded,
                        label: "Emergency checks",
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuButton(
                        icon: Icons.report_problem_outlined,
                        label: "Incident Report",
                        onTap: () {
                          // Navigate to the sub-page using a named route
                          Navigator.pushNamed(context, '/incident_report');
                        },
                      ),
                      MenuButton(
                        icon: Icons.verified_user_outlined,
                        label: "Security checks",
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Third Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuButton(
                        icon: Icons.cloud_upload_outlined,
                        label: "Force upload",
                        onTap: () {},
                      ),
                      MenuButton(
                        icon: Icons.location_on_outlined,
                        label: "Site check",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Previous Checks + View all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Previous Checks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF121212),
                    ),
                  ),
                  GestureDetector(
                    onTap: onViewAllTapped,
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A3C5E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Scrollable Previous Checks
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  LastCheckCard(
                    title: "Daily Defect Check",
                    subtitle: "TX-2048",
                    date: "20-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                  LastCheckCard(
                    title: "Maintenance Review",
                    subtitle: "TX-3052",
                    date: "18-04-25",
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
