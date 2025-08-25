import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Widgets/home_widgets.dart';

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
  final List<StepData> _stepData = List.generate(7, (index) => StepData());
  final int _totalSteps = 7;

  final List<String> _titles = [
    "Insert Mileage",
    "Insert Photo of Interior Front",
    "Insert Photo of Interior Rear",
    "Insert Photo of Front",
    "Insert Photo of Nearside",
    "Insert Photo of Rear",
    "Insert Photo of Offside",
  ];

  Future<void> _navigateToNextStep(
    int currentStep,
    XFile? image,
    String? notes,
    bool? isDefective,
  ) async {
    _stepData[currentStep - 1].image = image;
    _stepData[currentStep - 1].notes = notes;
    _stepData[currentStep - 1].isDefective = isDefective;

    if (currentStep < _totalSteps) {
      final nextStep = currentStep + 1;

      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StepScreenWidget(
            stepNumber: nextStep,
            totalSteps: _totalSteps,
            titleText: _titles[nextStep - 1],
            onNextPressed: _navigateToNextStep,

            initialImage: _stepData[nextStep - 1].image,
            initialNotes: _stepData[nextStep - 1].notes,
            initialIsDefective: _stepData[nextStep - 1].isDefective,
            showBackButton: true,
            showBottomBackButton: true,
            onBottomBackPressed: () {
              Navigator.pop(context, {
                'image': _stepData[nextStep - 1].image,
                'notes': _stepData[nextStep - 1].notes,
                'isDefective': _stepData[nextStep - 1].isDefective,
              });
            },
          ),
        ),
      );

      if (result != null && result is Map<String, dynamic>) {
        setState(() {
          _stepData[nextStep - 1].image = result['image'];
          _stepData[nextStep - 1].notes = result['notes'];
          _stepData[nextStep - 1].isDefective = result['isDefective'];
        });
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Workflow complete!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StepScreenWidget(
      stepNumber: 1,
      totalSteps: _totalSteps,
      titleText: _titles[0],
      initialImage: _stepData[0].image,
      initialNotes: _stepData[0].notes,
      initialIsDefective: _stepData[0].isDefective,
      onNextPressed: _navigateToNextStep,
      showBackButton: false,
      showBottomBackButton: false,
    );
  }
}
