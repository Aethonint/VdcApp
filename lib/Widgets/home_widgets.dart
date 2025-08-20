import 'package:flutter/material.dart';

class StepScreenWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    const int totalSteps = 7;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final scale = screenHeight / 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 53, 95),
        leadingWidth: 100,
        leading: showBackButton
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
                      value: stepNumber / totalSteps,
                      backgroundColor: Colors.grey[300],
                      color: const Color.fromARGB(255, 9, 81, 139),
                      minHeight: 4 * scale,
                    ),
                    SizedBox(height: 8 * scale),
                    Text(
                      "Step $stepNumber/$totalSteps",
                      style: TextStyle(
                        fontSize: 12 * scale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6 * scale),
                    Text(
                      titleText,
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
                      onPressed: () {},
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8 * scale),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size.fromHeight(40 * scale),
                        textStyle: TextStyle(fontSize: 12 * scale),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 12 * scale),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 90 * scale,
                            color: const Color.fromARGB(255, 0, 0, 0),
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
                          color: const Color.fromARGB(255, 9, 81, 139),
                        ),
                        SizedBox(width: 4 * scale),
                        Text(
                          "Image",
                          style: TextStyle(
                            fontSize: 12 * scale,
                            color: const Color.fromARGB(255, 9, 81, 139),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 12 * scale),
                        Icon(
                          Icons.copy,
                          size: 16 * scale,
                          color: const Color.fromARGB(255, 9, 81, 139),
                        ),
                        SizedBox(width: 4 * scale),
                        Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 12 * scale,
                            color: const Color.fromARGB(255, 9, 81, 139),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10 * scale),

                    // Buttons always at bottom
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showBottomBackButton)
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
                              backgroundColor: const Color.fromARGB(
                                255,
                                1,
                                59,
                                107,
                              ),
                            ),
                            onPressed: onBottomBackPressed,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        if (showBottomBackButton) SizedBox(width: 10 * scale),
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
                            backgroundColor: const Color.fromARGB(
                              255,
                              1,
                              59,
                              107,
                            ),
                          ),
                          onPressed: onNextPressed,
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
