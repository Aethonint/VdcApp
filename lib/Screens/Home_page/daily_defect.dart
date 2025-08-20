import 'package:flutter/material.dart';
import 'package:fleetedge/widgets/top_backnav.dart';
import 'screen1.dart';

class DailyDefectCheckScreen extends StatefulWidget {
  const DailyDefectCheckScreen({super.key});

  @override
  State<DailyDefectCheckScreen> createState() => _DailyDefectCheckScreenState();
}

class _DailyDefectCheckScreenState extends State<DailyDefectCheckScreen> {
  int _selectedIndex = 0;
  final TextEditingController _vrnController = TextEditingController();

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Reusable Top Navigation
      appBar: const TopNavigationBar(showBackButton: true),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.directions_car,
                          color: Colors.black,
                          size: 28,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Daily Defect Check",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    TextField(
                      controller: _vrnController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Enter VRN ●",
                        hintStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.yellow[700],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    // Continue button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(26, 60, 94, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Screen1(),
                            ),
                          );
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
