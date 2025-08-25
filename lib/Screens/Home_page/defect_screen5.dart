import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'defect_screen6.dart';
import 'defect_screen4.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 5,
      titleText: 'Insert Photo of Nearside',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: (stepNumber, capturedImage, notesText, isDefective) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen6()));
      },
      onBottomBackPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen4()));
      },
    );
  }
}
