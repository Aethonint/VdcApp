import 'package:flutter/material.dart';
// import 'Screens/Home/screen1.dart';
import 'Screens/Splashscreens/splashscreen1.dart';
// import 'Screens/Splashscreens/splashscreen2.dart';

void main() {
  runApp(const MyApp());            //testing
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen1(),
    ); 
  }
}
