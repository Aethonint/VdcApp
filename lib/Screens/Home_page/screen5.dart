import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'screen6.dart';
import 'screen4.dart';


class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 5, // First step
      titleText: 'Insert Photo of Nearside',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: () {
        // Navigate to Screen2
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
