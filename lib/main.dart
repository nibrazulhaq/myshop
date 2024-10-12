
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page_routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "INVOSHOP",
      defaultTransition: Transition.native,
      transitionDuration: const Duration(seconds: 0),
      getPages: getPages(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splashScreen',
    );
  }
}
