import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankYouScreen extends StatelessWidget {
  final String trackingId;

  ThankYouScreen({required this.trackingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tick Icon
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),

            // Thank You Message
            Text(
              'Thank You!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Your order has been successfully confirmed.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Tracking ID
            Text(
              'Your Tracking ID: $trackingId',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),

            // Back to Shopping Button
            ElevatedButton(
              onPressed: () {
                // Navigate back to the shopping page
                Get.offAllNamed('/dashboard'); // Adjust the route to your shopping page
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Back to Shopping', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
