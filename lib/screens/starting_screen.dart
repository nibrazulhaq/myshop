import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starting Page'),
      ),
      body: Center(
        child: Text('Welcome to Invoshop!'),
      ),
    );
  }
}
