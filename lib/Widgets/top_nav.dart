import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopNavBar extends StatelessWidget {
  final String title;
  final VoidCallback? onNotificationTap;

  const TopNavBar({
    super.key,
    required this.title,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure status bar matches top nav bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 1, 59, 107), // Blue
        statusBarIconBrightness: Brightness.light, // White icons
      ),
    );

    return Container(
      color: const Color.fromARGB(255, 1, 59, 107),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 28,
            ),
            onPressed: onNotificationTap,
          ),
        ],
      ),
    );
  }
}
