import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'featuers/home/view_model/home_view_model.dart';
import 'firebase_options.dart';
import 'app_config/page_routes.dart';
import 'cart_service.dart';
import 'helper/notification_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize local notifications
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await NotificationHelper.initialize(flutterLocalNotificationsPlugin);

  // Register services
  Get.put(CartService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "INVOSHOP",
      defaultTransition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
      getPages: getPages(),
      initialRoute: '/login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
