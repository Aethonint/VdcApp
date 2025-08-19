import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';

class IncidentDetailScreen extends StatelessWidget {
  final String title;

  const IncidentDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Camera Box
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt, size: 150, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),

            const SizedBox(height: 20),

            // Image & Notes row
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

            SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: save action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$title saved!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 81, 139),
                  padding: const EdgeInsets.symmetric(vertical: 16,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentIndex: 0,
      //   onTap: (index) {},
      // ),
    );
  }
}
