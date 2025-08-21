import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fleetedge/widgets/top_backnav.dart';
import 'screen1.dart';

// ✅ Correct imports for global data
import 'package:fleetedge/API/user_data.dart';     // for loggedInUserToken
import 'package:fleetedge/API/vehicle_data.dart'; // for globalVehicleNo & globalAssignmentId

class DailyDefectCheckScreen extends StatefulWidget {
  const DailyDefectCheckScreen({super.key});

  @override
  State<DailyDefectCheckScreen> createState() => _DailyDefectCheckScreenState();
}

class _DailyDefectCheckScreenState extends State<DailyDefectCheckScreen> {
  int _selectedIndex = 0;
  final TextEditingController _vrnController = TextEditingController();
  bool _vehicleFetched = false;

  @override
  void initState() {
    super.initState();
    _fetchAssignedVehicle();
  }

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _fetchAssignedVehicle() async {
    final url = Uri.parse("https://vdc.freetoolsclub.com/api/driver/assignment");

    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $loggedInUserToken",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body);

        if (body["status"] == true && body["data"] != null) {
          final data = body["data"];
          final vehicle = data["vehicle"];

          setState(() {
            _vrnController.text = vehicle["vehicle_no"];
            _vehicleFetched = true;
          });

          // ✅ Save globally
          globalVehicleNo = vehicle["vehicle_no"];
          globalAssignmentId = data["assignment_id"];
        }
      } else {
        debugPrint("Failed to fetch vehicle: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching vehicle: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
                      enabled: false, // user cannot edit
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _vehicleFetched ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: _vehicleFetched
                            ? "Vehicle Assigned"
                            : "Enter VRN ●",
                        hintStyle: TextStyle(
                          color: _vehicleFetched ? Colors.green : Colors.red,
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
                          if (_vehicleFetched) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Screen1(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("No Vehicle Assigned"),
                                content: const Text(
                                  "You do not have any vehicle assigned yet.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          }
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
