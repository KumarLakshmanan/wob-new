import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';

class MyId extends StatelessWidget {
  const MyId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor:  Get.isDarkMode ? design.dark.secondary : design.light.secondary,
        title: const Text(
          'My ID',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/icons/questions.png",
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          "assets/images/qrscan.png",
        ),
      ),
    );
  }
}
