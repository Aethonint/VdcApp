import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'screen6.dart';
import 'screen1.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 7,
      titleText: 'Insert Photo of Offside',
      showBackButton: true,
      showBottomBackButton: true,

      onNextPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen1()));
      },
      onBottomBackPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const Screen6()));
      },
    );
  }
}
