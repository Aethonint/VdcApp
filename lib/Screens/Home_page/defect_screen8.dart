import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';
import 'package:fleetedge/Widgets/defect_screen_widget.dart';

class DefectCheckScreen extends StatelessWidget {
  const DefectCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(
        showBackButton: true,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          DefectCheckCard(
            title: "Check the brake fluid, coolant and oil",
            initialValue: true,
          ),
          DefectCheckCard(
            title: "Check power steering fluid, windscreen fluid",
          ),
          DefectCheckCard(
            title: "With engine on, check underneath for leaks",
          ),
          DefectCheckCard(
            title: "Check exhaust doesn’t emit excessive smoke",
          ),
          DefectCheckCard(
            title: "Check fuel filler cap is securely fitted",
          ),
        ],
      ),
    );
  }
}
