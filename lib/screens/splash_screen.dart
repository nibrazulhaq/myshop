
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/login');  // Navigate to Registration Screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row content
          children: [
            Image.asset(
              'assets/invoshop.png',
              width: 100,
              height: 100,
            ),
            SizedBox(width: 10),
            Text(
              'INVOSHOP',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
