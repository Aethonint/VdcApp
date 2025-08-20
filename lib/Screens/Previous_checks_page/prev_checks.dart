import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';
import 'package:fleetedge/Widgets/checks_card.dart';

class PreviousChecksScreen extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const PreviousChecksScreen({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(
        showBackButton: true,
        onBackPressed: onBackPressed ?? () => Navigator.pop(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Previous Checks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF121212),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                LastCheckCard(
                  title: "Daily Defect Check",
                  subtitle: "TX-2048",
                  date: "20-04-25",
                ),
                LastCheckCard(
                  title: "Maintenance Review",
                  subtitle: "TX-3052",
                  date: "18-04-25",
                ),
                LastCheckCard(
                  title: "Maintenance Review",
                  subtitle: "TX-3052",
                  date: "18-04-25",
                ),
                LastCheckCard(
                  title: "Maintenance Review",
                  subtitle: "TX-3052",
                  date: "18-04-25",
                ),
                LastCheckCard(
                  title: "Maintenance Review",
                  subtitle: "TX-3052",
                  date: "18-04-25",
                ),
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
    );
  }
}
