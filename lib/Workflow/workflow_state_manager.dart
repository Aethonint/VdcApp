import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Widgets/home_widgets.dart'; // Make sure this path is correct.

// A simple class to hold the data for a single step.
class StepData {
  XFile? image;
  String? notes;
  bool? isDefective;

  StepData({this.image, this.notes, this.isDefective});
}

class WorkflowStateManager extends StatefulWidget {
  const WorkflowStateManager({super.key});

  @override
  _WorkflowStateManagerState createState() => _WorkflowStateManagerState();
}

class _WorkflowStateManagerState extends State<WorkflowStateManager> {
  // This list will hold the unique data for each of the 7 screens.
  final List<StepData> _stepData = List.generate(7, (index) => StepData());
  final int _totalSteps = 7;

  // This function is the callback for the "Next" button.
  // It saves the current screen's data and navigates to the next.
  // We'll now make this an async function to get a result from the next screen.
  Future<void> _navigateToNextStep(int currentStep, XFile? image, String? notes, bool? isDefective) async {
    // First, save the data for the current screen.
    _stepData[currentStep - 1].image = image;
    _stepData[currentStep - 1].notes = notes;
    _stepData[currentStep - 1].isDefective = isDefective;

    // Navigate to the next screen if it's not the last one.
    if (currentStep < _totalSteps) {
      final nextStep = currentStep + 1;

      // Navigate to the next screen and AWAIT the result.
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StepScreenWidget(
            stepNumber: nextStep,
            totalSteps: _totalSteps,
            titleText: "Step $nextStep",
            onNextPressed: _navigateToNextStep,
            // Pass the previously saved data for the next screen (if it exists).
            initialImage: _stepData[nextStep - 1].image,
            initialNotes: _stepData[nextStep - 1].notes,
            initialIsDefective: _stepData[nextStep - 1].isDefective,
            // The back button now also needs to return data.
            // This is the function the back button will call.
            onBottomBackPressed: () => Navigator.pop(context, {
              'image': _stepData[nextStep - 1].image,
              'notes': _stepData[nextStep - 1].notes,
              'isDefective': _stepData[nextStep - 1].isDefective,
            }),
            showBackButton: true, // You can make this conditional
            showBottomBackButton: true, // You can make this conditional
          ),
        ),
      );

      // When we navigate back, we get a result.
      // We check if the result is not null and is a Map.
      if (result != null && result is Map<String, dynamic>) {
        setState(() {
          // Update the data for the screen we came back to.
          // Note: `currentStep` here refers to the screen we returned to, which is one less than the step we were just on.
          _stepData[currentStep - 1].image = result['image'];
          _stepData[currentStep - 1].notes = result['notes'];
          _stepData[currentStep - 1].isDefective = result['isDefective'];
        });
      }
    } else {
      // All steps are complete.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workflow complete!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This is the first screen of the workflow.
    return StepScreenWidget(
      stepNumber: 1,
      totalSteps: _totalSteps,
      titleText: "Initial Step",
      // Pass the data for the first screen.
      initialImage: _stepData[0].image,
      initialNotes: _stepData[0].notes,
      initialIsDefective: _stepData[0].isDefective,
      // Pass the callback function to the StepScreenWidget.
      onNextPressed: _navigateToNextStep,
      // The first screen has no previous screen to go back to.
      showBackButton: false,
      showBottomBackButton: false,
    );
  }
}