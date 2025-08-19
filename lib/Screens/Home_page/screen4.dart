import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'screen3.dart';
import 'screen5.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 4, // First step
      titleText: 'Insert Photo of Front',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: () {
        // Navigate to Screen2
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen5()));
      },

      onBottomBackPressed: () {
        
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen3()));
      },
    );
  }
}
