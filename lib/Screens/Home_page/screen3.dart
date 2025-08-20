import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'screen2.dart';
import 'screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 3,
      titleText: 'Insert Photo of Interior Rear',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: () {
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
