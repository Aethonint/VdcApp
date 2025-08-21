// lib/API/daily_defect_data.dart

import 'dart:io';

/// Total number of defect check steps
const int kTotalSteps = 7;

/// Singleton class to hold data for all steps
class DailyDefectData {
  // Singleton instance
  static final DailyDefectData _instance = DailyDefectData._internal();
  factory DailyDefectData() => _instance;
  DailyDefectData._internal();

  /// Stores images for each step (nullable, initially empty)
  final List<File?> images = List<File?>.filled(kTotalSteps, null);

  /// Stores notes for each step (nullable, initially empty)
  final List<String?> notes = List<String?>.filled(kTotalSteps, null);

  /// Stores defect status for each step
  /// true = Yes, false = No, null = not selected yet
  final List<bool?> defective = List<bool?>.filled(kTotalSteps, null);

  // -------- Helpers --------

  void setImage(int stepIndex, File file) {
    if (_isValidStep(stepIndex)) {
      images[stepIndex] = file;
    }
  }

  void setNote(int stepIndex, String note) {
    if (_isValidStep(stepIndex)) {
      notes[stepIndex] = note;
    }
  }

  void setDefective(int stepIndex, bool value) {
    if (_isValidStep(stepIndex)) {
      defective[stepIndex] = value;
    }
  }

  File? getImage(int stepIndex) =>
      _isValidStep(stepIndex) ? images[stepIndex] : null;

  String? getNote(int stepIndex) =>
      _isValidStep(stepIndex) ? notes[stepIndex] : null;

  bool? getDefective(int stepIndex) =>
      _isValidStep(stepIndex) ? defective[stepIndex] : null;

  /// Clears all data (useful if user restarts the process)
  void clearAll() {
    for (int i = 0; i < kTotalSteps; i++) {
      images[i] = null;
      notes[i] = null;
      defective[i] = null;
    }
  }

  bool _isValidStep(int stepIndex) =>
      stepIndex >= 0 && stepIndex < kTotalSteps;
}
