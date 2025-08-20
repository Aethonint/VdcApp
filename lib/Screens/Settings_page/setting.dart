import 'package:flutter/material.dart';
import 'package:fleetedge/Widgets/top_backnav.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onBackPressed;

  const SettingsScreen({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(
        showBackButton: true,
        onBackPressed: onBackPressed,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxHeight < 600;

          final content = Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
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
                    const Expanded(
                      child: Text(
                        "AHMED",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF01355F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                      ),
                      onPressed: () {
                        // TODO: Edit Profile Action
                      },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Notifications
                _sectionTitle("Notifications"),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: true,
                  onChanged: (val) {
                    // TODO: Push Notifications Toggle
                  },
                  title: const Text("Push Notifications"),
                ),
                const SizedBox(height: 24),

                // Support & Information
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

                SizedBox(height: 60,),

                // Logout Button
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
                      onPressed: () {
                        // TODO: Logout logic
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          // If small device -> scroll, else stretch to fit
          if (isSmallScreen) {
            return SingleChildScrollView(child: content);
          } else {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(child: content),
            );
          }
        },
      ),
    );
  }

  // --- Helper Widgets ---

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
