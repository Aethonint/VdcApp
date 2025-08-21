import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/Routings/main_nav.dart';
import '/API/user_data.dart' as userData;

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  final TextEditingController _pinController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePin = true;

  Future<void> _login() async {
    final pinText = _pinController.text.trim();
    if (pinText.isEmpty) {
      _showDialog("Please enter your PIN");
      return;
    }

    int? pin = int.tryParse(pinText);
    if (pin == null) {
      _showDialog("PIN must be a number");
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("https://vdc.freetoolsclub.com/api/driver/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': pin}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['user'] != null) {
        userData.loggedInUserId = data['user']['id'];
        userData.loggedInUserName = data['user']['name'];
        userData.loggedInUserEmail = data['user']['email'];
        userData.loggedInUserToken = data['token'];

        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MainNavigation(initialIndex: 0),
          ),
          (route) => false,
        );
      } else {
        _showDialog("Check your PIN");
      }
    } catch (e) {
      _showDialog("Something went wrong. Please try again.");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Color(0xFF01355F))),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(double width, double height) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Container(
              width: width * 0.8,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    onTap: () => Navigator.of(context).pop(),
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(26, 60, 94, 1),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top:
                              height * 0.1 -
                              (bottomInset > 0 ? height * 0.04 : 0),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/fleetlogo.png',
                            height: height * 0.18,
                          ),
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
                                    controller: _pinController,
                                    obscureText: _obscurePin,
                                    keyboardType: TextInputType.number,
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
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePin
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: const Color.fromARGB(
                                            255,
                                            3,
                                            108,
                                            212,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePin = !_obscurePin;
                                          });
                                        },
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
                                onPressed: _isLoading ? null : _login,
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
                                child: _isLoading
                                    ? SizedBox(
                                        height: width * 0.04,
                                        width: width * 0.04,
                                        child: const CircularProgressIndicator(
                                          color: Color.fromARGB(
                                            255,
                                            3,
                                            108,
                                            212,
                                          ),
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        "Log in",
                                        style: TextStyle(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                            255,
                                            3,
                                            108,
                                            212,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: bottomInset > 0 ? height * 0.02 : 0,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showHelpDialog(width, height);
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
