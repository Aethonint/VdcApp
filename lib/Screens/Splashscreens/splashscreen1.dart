import 'dart:async';
import 'package:flutter/material.dart';
import 'splashscreen2.dart'; // Import your next splash screen

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();

    // Wait 5 seconds before navigating to SplashScreen2
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const SplashScreen2(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(26, 60, 94, 1),
      body: Center(
        child: Image(
          image: AssetImage('assets/fleetlogo.png'),
          height: 150,
        ),
      ),
    );
  }
}
