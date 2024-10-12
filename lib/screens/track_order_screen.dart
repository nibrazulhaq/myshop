import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  static const String id = '/track_order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Your Order'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Order tracking information will be displayed here.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
