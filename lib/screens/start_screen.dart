import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartGuideScreen extends StatelessWidget {
  static const String id = '/start-guide';

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust text size, padding, and other elements based on screen size
    double textSize = screenWidth < 600 ? 20 : 24;  // Smaller text size for small screens
    double descriptionTextSize = screenWidth < 600 ? 12 : 15;
    double buttonTextSize = screenWidth < 600 ? 16 : 18;
    EdgeInsets padding = EdgeInsets.all(screenWidth < 600 ? 8.0 : 16.0);
    double imageHeight = screenHeight * 0.3;  // Adjust image height dynamically

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide back button
        title: Text('WELCOME'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed('/dashboard'); // Navigate to dashboard if skipped
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white, fontSize: buttonTextSize),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: imageHeight,  // Set image height dynamically
              child: Image.asset('assets/guide.png'),
            ),
            Text(
              'Perfect Products for you',
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to FreshMart, your one-stop destination for all your grocery needs! '
                  'We pride ourselves on offering the freshest produce, high-quality meats, and a wide variety of pantry staples. '
                  'Whether you’re looking for organic options, local specialties, or everyday essentials, we have something for everyone. '
                  'Our friendly staff is here to help you find exactly what you need. '
                  'Explore our aisles and discover the best deals while enjoying a delightful shopping experience!',

              style: TextStyle(
                fontSize: descriptionTextSize,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            // Add additional guide content here, such as images, instructions, etc.
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.green),
                    title: Text('Feature 1: Overview of Feature 1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Feature 2: How to use Feature 2'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.green),
                    title: Text('Feature 3: Customize settings'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/dashboard'); // Navigate to dashboard after guide
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth < 600 ? 10 : 12,
                  horizontal: screenWidth < 600 ? 16 : 20,
                ),
                textStyle: TextStyle(fontSize: buttonTextSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

