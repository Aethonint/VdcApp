import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'defect_screen3.dart';
import 'defect_screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 2,
      titleText: 'Insert Photo of Interior Front',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: (stepNumber, capturedImage, notesText, isDefective) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen3()));
      },

      onBottomBackPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen1()));
      },
    );
  }
}
