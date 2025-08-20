import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  const TopNavigationBar({
    super.key,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 1, 59, 107),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 1, 53, 95),
      leadingWidth: 100,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: GestureDetector(
                onTap: onBackPressed ?? () => Navigator.pop(context),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
