import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'defect_screen2.dart';
import 'defect_screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 3,
      totalSteps: 7, // Assuming 7 total steps
      titleText: 'Insert Photo of Interior Rear',
      showBackButton: true,
      showBottomBackButton: true,

      // Corrected the onNextPressed function to accept the required arguments
      onNextPressed: (stepNumber, capturedImage, notesText, isDefective) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen4()));
      },

      onBottomBackPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen2()));
      },
    );
  }
}
