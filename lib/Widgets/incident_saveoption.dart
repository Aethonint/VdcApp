import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';

class IncidentDetailScreen extends StatelessWidget {
  final String title;

  const IncidentDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Container(
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.image_outlined,
                    size: 18,
                    color: Color.fromARGB(255, 9, 81, 139),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Image",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 9, 81, 139),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: 24),
                  Icon(
                    Icons.copy,
                    size: 18,
                    color: Color.fromARGB(255, 9, 81, 139),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 9, 81, 139),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("$title saved!")));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 81, 139),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
