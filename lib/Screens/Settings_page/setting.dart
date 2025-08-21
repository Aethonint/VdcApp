import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';
import '/API/user_data.dart' as userData;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Splashscreens/splashscreen2.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onBackPressed;

  const SettingsScreen({super.key, required this.onBackPressed});

  Future<void> _logout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              "No",
              style: TextStyle(color: Color(0xFF01355F)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              "Yes",
              style: TextStyle(color: Color(0xFF01355F)),
            ),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      final response = await http.post(
        Uri.parse("https://vdc.freetoolsclub.com/api/driver/logout"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userData.loggedInUserToken ?? ""}',
        },
      );

      if (response.statusCode == 200) {
        userData.clearUserData();

        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const SplashScreen2()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logout failed, try again.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Error logging out.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String firstName = userData.loggedInUserName ?? "User";
    final String email = userData.loggedInUserEmail ?? "user@example.com";

    return Scaffold(
      appBar: TopNavigationBar(
        showBackButton: true,
        onBackPressed: onBackPressed,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF01355F).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Color(0xFF01355F),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF01355F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              _sectionTitle("Notifications"),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                onChanged: (val) {},
                activeColor: const Color(0xFF01355F),
                title: const Text("Push Notifications"),
              ),
              const SizedBox(height: 24),

              _sectionTitle("Support & Information"),
              const SizedBox(height: 12),
              _settingsTile(
                icon: Icons.help_outline,
                label: "Help & Support",
                onTap: () {},
              ),
              _settingsTile(
                icon: Icons.shield_outlined,
                label: "Privacy Policy",
                onTap: () {},
              ),
              _settingsTile(
                icon: Icons.description_outlined,
                label: "Terms & Conditions",
                onTap: () {},
              ),
              _settingsTile(
                icon: Icons.info_outline,
                label: "About FleetEdge",
                onTap: () {},
              ),

              const SizedBox(height: 20),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF01355F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => _logout(context),
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      "Logout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF01355F),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: onTap,
    );
  }
}
