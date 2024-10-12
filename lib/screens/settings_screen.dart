import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              Get.toNamed('/change-password'); // Ensure that '/change-password' is defined
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              Get.toNamed('/notifications'); // Ensure that '/notifications' is defined
            },
          ),
          ListTile(
            title: Text('Privacy Settings'),
            onTap: () {
              Get.toNamed('/privacy-settings'); // Ensure that '/privacy-settings' is defined
            },
          ),
          ListTile(
            title: Text('Help'),
            onTap: () {
              Get.toNamed('/help'); // Ensure that '/help' is defined
            },
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              Get.toNamed('/feedback'); // Ensure that '/feedback' is defined
            },
          ),
          ListTile(
            title: Text('Language'),
            onTap: () {
              Get.toNamed('/language'); // Ensure that '/language' is defined
            },
          ),
        ],
      ),
    );
  }
}
