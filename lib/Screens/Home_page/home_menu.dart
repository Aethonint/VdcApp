import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/Top_nav.dart';
import 'package:fleetedge/Widgets/Checks_card.dart';
import 'package:fleetedge/Widgets/home_menus.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onViewAllTapped;

  const HomeScreen({super.key, required this.onViewAllTapped});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopNavBar(title: "FleetEdge", onNotificationTap: () {}),

                SizedBox(height: height * 0.025),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "Last Check",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF121212),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  padding: EdgeInsets.all(width * 0.04),
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
                      Text(
                        "Daily Checks & Reports",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF121212),
                        ),
                      ),
                      SizedBox(height: height * 0.015),

                      Row(
                        children: [
                          Expanded(
                            child: MenuButton(
                              icon: Icons.car_rental,
                              label: "Daily defect check",
                              onTap: () {
                                Navigator.pushNamed(context, '/daily_defect');
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: MenuButton(
                              icon: Icons.warning_amber_rounded,
                              label: "Emergency checks",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.015),

                      Row(
                        children: [
                          Expanded(
                            child: MenuButton(
                              icon: Icons.report_problem_outlined,
                              label: "Incident Report",
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/incident_report',
                                );
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: MenuButton(
                              icon: Icons.verified_user_outlined,
                              label: "Security checks",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.015),

                      Row(
                        children: [
                          Expanded(
                            child: MenuButton(
                              icon: Icons.cloud_upload_outlined,
                              label: "Force upload",
                              onTap: () {},
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: MenuButton(
                              icon: Icons.location_on_outlined,
                              label: "Site check",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Previous Checks",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF121212),
                        ),
                      ),
                      GestureDetector(
                        onTap: onViewAllTapped,
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A3C5E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.015),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
