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
    // TODO: Add navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Reusable Top Navigation
      appBar: const TopNavigationBar(showBackButton: true),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row for Icon + Text
                    Row(
                      children: const [
                        Icon(
                          Icons.directions_car,
                          color: Colors.black,
                          size: 35,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Daily Defect Check",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // VRN Input Field
                    TextField(
                      controller: _vrnController,
                      textAlign: TextAlign.center, // centers hint & user text
                      decoration: InputDecoration(
                        hintText: "Enter VRN ●",
                        hintStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.yellow[700],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 120),

                    // Continue button
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(26, 60, 94, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Screen1(), // your target screen
                            ),
                          );
                        },

                        child: const Text(
                          "Continue",
                          style: TextStyle(
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

      //  Reusable Bottom Navigation
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onNavBarTap,
      // ),
    );
  }
}
