import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    log('notification called');
    const androidInitialization = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: androidInitialization);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Implement navigation logic if needed
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("onMessage: ${message.data}");
      showTextNotification(message, flutterLocalNotificationsPlugin);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("onMessageApp: ${message.data}");
      // Implement navigation logic based on the message data
    });
  }

  static Future<void> showTextNotification(RemoteMessage message, FlutterLocalNotificationsPlugin fln) async {
    log('Notification Message: $message');
    final title = message.notification?.title;
    final body = message.notification?.body;

    const androidDetails = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
      enableLights: true,
      enableVibration: true,
      playSound: true,
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    await fln.show(0, title, body, platformDetails, payload: json.encode(message.data));
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  log("Background Message Handler triggered");
}
