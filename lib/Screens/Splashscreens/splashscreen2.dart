import 'package:flutter/material.dart';
import '/Routings/main_nav.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(26, 60, 94, 1),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: Image.asset(
                      'assets/fleetlogo.png',
                      height: height * 0.18,
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.075,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Login to your account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.04),

                        SizedBox(
                          width: width * 0.7,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(
                                    left: width * 0.15,
                                  ),
                                  hintText: "Please enter your PIN",
                                  hintStyle: TextStyle(
                                    fontSize: width * 0.035,
                                    color: const Color(0xFF777777),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -width * 0.05,
                                top: -height * 0.006,
                                child: Container(
                                  width: width * 0.15,
                                  height: width * 0.15,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.lock,
                                    color: const Color.fromARGB(
                                      255,
                                      3,
                                      108,
                                      212,
                                    ),
                                    size: width * 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.04),

                        SizedBox(
                          width: width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainNavigation(initialIndex: 0),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color.fromRGBO(
                                26,
                                60,
                                94,
                                1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.018,
                              ),
                            ),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 3, 108, 212),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.04),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    width: width * 0.8,
                                    height: height * 0.38,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Need Help?",
                                          style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.01),
                                        Text(
                                          "For assistance or to request a demonstration, please contact us using the details below.",
                                          style: TextStyle(
                                            fontSize: width * 0.028,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text(
                                          "Call Support",
                                          style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "0330 861 8338",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF0061FE),
                                          ),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text(
                                          "Email Support",
                                          style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "support@aethon.digital",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF0061FE),
                                          ),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        GestureDetector(
                                          onTap: Navigator.of(context).pop,
                                          child: Text(
                                            "Close",
                                            style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF0061FE),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Need help?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Text(
                          "© Copyright VCC App Ltd 2025",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
