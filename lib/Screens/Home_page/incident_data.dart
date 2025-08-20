import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/bottom_nav.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';
import 'package:fleetedge/Widgets/incident_saveoption.dart';

class IncidentOptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const IncidentOptionButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromRGBO(26, 60, 94, 1),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Color.fromRGBO(26, 60, 94, 1),
                width: 1.5,
              ),
            ),
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(26, 60, 94, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IncidentScreen extends StatefulWidget {
  const IncidentScreen({super.key});

  @override
  State<IncidentScreen> createState() => _IncidentScreenState();
}

class _IncidentScreenState extends State<IncidentScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(showBackButton: true),

      body: ListView(
        children: [
          IncidentOptionButton(
            title: "Accident Location",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const IncidentDetailScreen(title: "Accident Location"),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Name",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const IncidentDetailScreen(title: "3rd Party Name"),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Address",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const IncidentDetailScreen(title: "3rd Party Address"),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Phone Number",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "3rd Party Phone Number",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Employer (if Haulier)",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Employer (if Haulier)",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Vehicle Registration",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const IncidentDetailScreen(title: "Vehicle Registration"),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Non Vehicle Damage (street light/barrier etc)",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Non Vehicle Damage (street light/barrier etc)",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Police Officer Name/Number",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Police Officer Name/Number",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Incident Details",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const IncidentDetailScreen(title: "Incident Details"),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Vehicle Photo Front",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "3rd Party Vehicle Photo Front",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Vehicle Photo Near Side",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "3rd Party Vehicle Photo Near Side",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Vehicle Photo Off Side",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "3rd Party Vehicle Photo Off Side",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "3rd Party Vehicle Photo Rear",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "3rd Party Vehicle Photo Rear",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Own Vehicle Photo Front",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Own Vehicle Photo Front",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Own Vehicle Photo Near Side",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Own Vehicle Photo Near Side",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Own Vehicle Photo Off Side",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Own Vehicle Photo Off Side",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "Own Vehicle Photo Rear",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "Own Vehicle Photo Rear",
                  ),
                ),
              );
            },
          ),
          IncidentOptionButton(
            title: "AI CAMERA FACING REAR",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const IncidentDetailScreen(
                    title: "AI CAMERA FACING REAR",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
