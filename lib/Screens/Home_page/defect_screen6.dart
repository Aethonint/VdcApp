import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'defect_screen7.dart';
import 'defect_screen5.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 6,
      titleText: 'Insert Photo of Rear',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: (stepNumber, capturedImage, notesText, isDefective) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen7()));
      },

      onBottomBackPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen5()));
      },
    );
  }
}
