import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StepScreenWidget extends StatefulWidget {
  final int stepNumber;
  final String titleText;
  final bool showBackButton;
  final bool showBottomBackButton;
  final VoidCallback? onNextPressed;
  final VoidCallback? onBottomBackPressed;

  const StepScreenWidget({
    super.key,
    required this.stepNumber,
    required this.titleText,
    this.showBackButton = true,
    this.showBottomBackButton = false,
    this.onNextPressed,
    this.onBottomBackPressed,
  });

  @override
  State<StepScreenWidget> createState() => _StepScreenWidgetState();
}

class _StepScreenWidgetState extends State<StepScreenWidget> {
  bool? isDefective; // null = not selected, true = Yes, false = No
  final ImagePicker _picker = ImagePicker();
  String? _notesText;
  XFile? _capturedImage;

  final Color primaryBlue = const Color.fromARGB(255, 1, 59, 107);

  // Ensure image persists if widget rebuilds
  @override
  void didUpdateWidget(covariant StepScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // nothing needed here as _capturedImage is kept in State
  }

  Future<void> _openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _capturedImage = pickedFile;
      });
      _showCustomDialog("Success", "Image captured successfully", true);
    }
  }

  void _handleNotesClick() {
    if (isDefective == null) {
      _showCustomDialog(
        "Action Required",
        "Please select 'Yes' or 'No' first.",
        false,
      );
      return;
    }

    if (isDefective == true) {
      // Show notes dialog as before
      showDialog(
        context: context,
        builder: (context) {
          final TextEditingController controller = TextEditingController(
            text: _notesText,
          );
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add Notes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Write your notes here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryBlue, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryBlue, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _notesText = controller.text;
                          });
                          Navigator.pop(context);
                          _showCustomDialog(
                            "Success",
                            "Notes saved successfully",
                            true,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Show alert if No defect
      _showCustomDialog(
        "No Notes Required",
        "No defect selected, no notes needed.",
        false,
      );
    }
  }

  void _validateAndProceed() {
    if (_capturedImage == null) {
      _showCustomDialog(
        "Image Required",
        "Please capture an image before proceeding.",
        false,
      );
      return;
    }

    if (isDefective == true && (_notesText == null || _notesText!.isEmpty)) {
      _showCustomDialog(
        "Notes Required",
        "Please add notes for defective item.",
        false,
      );
      return;
    }

    if (widget.onNextPressed != null) widget.onNextPressed!();
  }

  void _showCustomDialog(String title, String message, bool success) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                success ? Icons.check_circle : Icons.info_outline,
                color: success ? Colors.green : primaryBlue,
                size: 50,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: primaryBlue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
                child: const Text("OK", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const int totalSteps = 7;
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 53, 95),
        leadingWidth: 100,
        leading: widget.showBackButton
            ? Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 6),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 18 * scale,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12 * scale,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        actions: [
          Icon(Icons.notifications_none, color: Colors.white, size: 22 * scale),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10 * scale),
        child: Column(
          children: [
            SizedBox(height: 8 * scale),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 8 * scale,
                  vertical: 8 * scale,
                ),
                padding: EdgeInsets.all(12 * scale),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: widget.stepNumber / totalSteps,
                      backgroundColor: Colors.grey[300],
                      color: const Color.fromARGB(255, 9, 81, 139),
                      minHeight: 4 * scale,
                    ),
                    SizedBox(height: 8 * scale),
                    Text(
                      "Step ${widget.stepNumber}/$totalSteps",
                      style: TextStyle(
                        fontSize: 12 * scale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6 * scale),
                    Text(
                      widget.titleText,
                      style: TextStyle(
                        fontSize: 16 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10 * scale),

                    Center(
                      child: Text(
                        "Defective?",
                        style: TextStyle(
                          fontSize: 16 * scale,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8 * scale),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 40, 199, 74),
                        minimumSize: Size.fromHeight(40 * scale),
                        textStyle: TextStyle(fontSize: 12 * scale),
                      ),
                      onPressed: () {
                        setState(() {
                          isDefective = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white),
                          ),
                          if (isDefective == true)
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8 * scale),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size.fromHeight(40 * scale),
                        textStyle: TextStyle(fontSize: 12 * scale),
                      ),
                      onPressed: () {
                        setState(() {
                          isDefective = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "No",
                            style: TextStyle(color: Colors.white),
                          ),
                          if (isDefective == false)
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12 * scale),

                    Expanded(
                      child: GestureDetector(
                        onTap: _openCamera,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: _capturedImage == null
                              ? Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 90 * scale,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_capturedImage!.path),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * scale),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 16 * scale,
                          color: primaryBlue,
                        ),
                        SizedBox(width: 4 * scale),
                        GestureDetector(
                          onTap: _openCamera,
                          child: Text(
                            "Image",
                            style: TextStyle(
                              fontSize: 12 * scale,
                              color: primaryBlue,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(width: 12 * scale),
                        Icon(Icons.copy, size: 16 * scale, color: primaryBlue),
                        SizedBox(width: 4 * scale),
                        GestureDetector(
                          onTap: _handleNotesClick,
                          child: Text(
                            "Notes",
                            style: TextStyle(
                              fontSize: 12 * scale,
                              color: primaryBlue,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10 * scale),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.showBottomBackButton)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40 * scale,
                                vertical: 12 * scale,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: TextStyle(fontSize: 12 * scale),
                              backgroundColor: primaryBlue,
                            ),
                            onPressed: widget.onBottomBackPressed,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        if (widget.showBottomBackButton)
                          SizedBox(width: 10 * scale),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40 * scale,
                              vertical: 12 * scale,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: TextStyle(fontSize: 12 * scale),
                            backgroundColor: primaryBlue,
                          ),
                          onPressed: _validateAndProceed,
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
