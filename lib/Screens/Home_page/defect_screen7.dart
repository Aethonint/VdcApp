import 'package:flutter/material.dart';
import '/Widgets/home_widgets.dart';
import 'defect_screen6.dart';
import 'defect_screen1.dart';
import '/API/daily_defect_data.dart'; // Import your singleton

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  void _submitAll(BuildContext context) {
    final DailyDefectData data = DailyDefectData();

    // Example: Check if all images are present
    bool allImagesPresent = data.images.every((image) => image != null);

    if (!allImagesPresent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please capture all images before submitting."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Call your API here and send all images
    // data.images contains List<File?> for all steps

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All images submitted successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    // Optionally clear data after submission
    // data.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 7,
      titleText: 'Insert Photo of Offside',
      showBackButton: true,
      showBottomBackButton: true,
      onNextPressed: (stepNumber, capturedImage, notesText, isDefective) {
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
