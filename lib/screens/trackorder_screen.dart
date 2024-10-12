import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  static const String id = '/track-order'; // Route for this screen

  // Simulating the current progress level (you can change this based on the actual status)
  final int _currentStep = 3; // For example, "Out for Delivery" is step 3

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
              'Order #12345',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Progress Indicator (Steps)
            Stepper(
              currentStep: _currentStep,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container(); // Hides the default navigation buttons of the Stepper
              },
              steps: _getOrderSteps(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the order status as steps
  List<Step> _getOrderSteps() {
    return [
      Step(
        title: Text('Order Placed'),
        content: Text('Your order has been placed.'),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Processing'),
        content: Text('Your order is being processed.'),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Shipped'),
        content: Text('Your order has been shipped.'),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Out for Delivery'),
        content: Text('Your order is out for delivery.'),
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Delivered'),
        content: Text('Your order has been delivered.'),
        isActive: _currentStep >= 4,
        state: _currentStep == 4 ? StepState.complete : StepState.indexed,
      ),
    ];
  }
}
