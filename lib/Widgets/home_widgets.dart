import 'package:flutter/material.dart';

class StepScreenWidget extends StatelessWidget {
  final int stepNumber;
  final String titleText;
  final bool showBackButton; // AppBar back button
  final bool showBottomBackButton; // NEW: controls bottom back button
  final VoidCallback? onNextPressed;
  final VoidCallback? onBottomBackPressed; // NEW: bottom back button action

  const StepScreenWidget({
    super.key,
    required this.stepNumber,
    required this.titleText,
    this.showBackButton = true,
    this.showBottomBackButton = false, // default hidden
    this.onNextPressed,
    this.onBottomBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    const int totalSteps = 7;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 53, 95),
        leadingWidth: 100,
        leading: showBackButton
            ? Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "Back",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white, size: 30),
          SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 90,
                top: 20,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: stepNumber / totalSteps,
                    backgroundColor: Colors.grey[300],
                    color: Color.fromARGB(255, 9, 81, 139),
                    minHeight: 6,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Step $stepNumber/$totalSteps",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      "Defective?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 13),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 40, 199, 74),
                      minimumSize: const Size.fromHeight(50),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size.fromHeight(50),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "No",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 35),

                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.camera_alt, size: 150),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.image_outlined,
                        size: 20,
                        color: Color.fromARGB(255, 9, 81, 139),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Image",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 81, 139),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 30),
                      Icon(
                        Icons.copy,
                        size: 20,
                        color: Color.fromARGB(255, 9, 81, 139),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 9, 81, 139),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Bottom Back & Next buttons
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showBottomBackButton)
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 90,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  textStyle: const TextStyle(fontSize: 16),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    1,
                                    59,
                                    107,
                                  ),
                                ).copyWith(
                                  backgroundColor: WidgetStateProperty.all(
                                    const Color.fromARGB(255, 1, 59, 107),
                                  ),
                                ),
                            onPressed: onBottomBackPressed,
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        if (showBottomBackButton) const SizedBox(width: 20),
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 80,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textStyle: const TextStyle(fontSize: 16),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  1,
                                  59,
                                  107,
                                ),
                              ).copyWith(
                                backgroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(255, 1, 59, 107),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(24),
      //     child: BottomNavigationBar(
      //       backgroundColor: const Color.fromARGB(255, 1, 59, 107),
      //       type: BottomNavigationBarType.fixed,
      //       iconSize: 60,
      //       selectedFontSize: 20,
      //       unselectedFontSize: 20,
      //       selectedItemColor: Colors.white,
      //       unselectedItemColor: const Color.fromARGB(179, 255, 255, 255),
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home_outlined),
      //           label: 'Home',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.checklist_outlined),
      //           label: 'Previous checks',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.description),
      //           label: 'Ancillary',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.settings_outlined),
      //           label: 'Settings',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
