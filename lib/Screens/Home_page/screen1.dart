import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 1, // First step
      titleText: 'Insert Mileage',
      showBackButton: true,

      onNextPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen2()));
      },
    );
  }
}
