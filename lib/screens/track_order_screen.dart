import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  static const String id = '/track-order'; // Define the route name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Order Status',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Example of a step progress indicator
            Stepper(
              currentStep: 1, // Index of the current step in progress
              steps: [
                Step(
                  title: Text('Order Placed'),
                  content: Text('Your order has been placed successfully.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Order Processed'),
                  content: Text('Your order is being processed.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Shipped'),
                  content: Text('Your order is on the way.'),
                  isActive: false,
                ),
                Step(
                  title: Text('Delivered'),
                  content: Text('Your order has been delivered.'),
                  isActive: false,
                ),
              ],
            ),
            // Add more tracking details here
          ],
        ),
      ),
    );
  }
}
