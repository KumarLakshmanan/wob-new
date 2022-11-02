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
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          headline5: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          headline6: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          subtitle2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          bodyText2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
          overline: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      color: design.light.primary,
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
