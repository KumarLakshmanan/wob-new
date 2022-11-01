import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/splash/splash.dart';

import 'controller/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(NController());
    Get.put(DataController());
    return GetMaterialApp(
      title: 'Wob',
      theme: ThemeData(
        primaryColor: design.light.primary,
        primarySwatch: primaryColor,
      ),
      color: design.light.primary,
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
