import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StepScreenWidget extends StatefulWidget {
  final int stepNumber;
  final int? totalSteps;
  final String titleText;

  final Function(int stepNumber, XFile?, String?, bool?)? onNextPressed;

  final XFile? initialImage;
  final String? initialNotes;
  final bool? initialIsDefective;

  final bool? showBackButton;
  final bool? showBottomBackButton;
  final VoidCallback? onBottomBackPressed;

  const StepScreenWidget({
    super.key,
    required this.stepNumber,
    required this.titleText,
    this.totalSteps,
    this.initialImage,
    this.initialNotes,
    this.initialIsDefective,
    this.showBackButton,
    this.showBottomBackButton,
    this.onBottomBackPressed,
    this.onNextPressed,
  });

  @override
  State<StepScreenWidget> createState() => _StepScreenWidgetState();
}

class _StepScreenWidgetState extends State<StepScreenWidget> {
  bool? isDefective;
  final ImagePicker _picker = ImagePicker();
  String? _notesText;
  XFile? _capturedImage;

  final Color primaryBlue = const Color.fromARGB(255, 1, 59, 107);
  final double buttonWidth = 120.0;

  @override
  void initState() {
    super.initState();
    _capturedImage = widget.initialImage;
    _notesText = widget.initialNotes;
    isDefective = widget.initialIsDefective;
  }

  Future<void> _pickFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _capturedImage = pickedFile;
      });
    }
  }

  Future<void> _pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _capturedImage = pickedFile;
      });
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

    if (isDefective == null) {
      _showCustomDialog(
        "Selection Required",
        "Please select 'Yes' or 'No' before proceeding.",
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

    if (widget.onNextPressed != null) {
      widget.onNextPressed!(
        widget.stepNumber,
        _capturedImage,
        _notesText,
        isDefective,
      );
    }
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
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 53, 95),
        leadingWidth: 100,
        leading: (widget.showBackButton == true || widget.stepNumber > 1)
            ? Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 6),
                child: GestureDetector(
                  onTap: widget.onBottomBackPressed,
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
                    if (widget.totalSteps != null)
                      LinearProgressIndicator(
                        value: widget.stepNumber / widget.totalSteps!,
                        backgroundColor: Colors.grey[300],
                        color: const Color.fromARGB(255, 9, 81, 139),
                        minHeight: 4 * scale,
                      ),
                    SizedBox(height: 8 * scale),
                    Text(
                      widget.totalSteps != null
                          ? "Step ${widget.stepNumber}/${widget.totalSteps}"
                          : "Step ${widget.stepNumber}",
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
                        onTap: _pickFromCamera,
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
                                  child: kIsWeb
                                      ? Image.network(
                                          _capturedImage!.path,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        )
                                      : Image.file(
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
                          onTap: _pickFromGallery,
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
                        if (widget.showBottomBackButton == true)
                          SizedBox(
                            width: buttonWidth,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12 * scale,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(fontSize: 12 * scale),
                                backgroundColor: Colors.grey,
                              ),
                              onPressed: widget.onBottomBackPressed,
                              child: const Text(
                                "Back",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: widget.showBottomBackButton == true
                              ? 10 * scale
                              : 0,
                        ),
                        SizedBox(
                          width: buttonWidth,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
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
