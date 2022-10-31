import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/navigation.dart';

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final nc = Get.put(NController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Get.isDarkMode ? design.dark.secondary : design.light.secondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            nc.currentPage = 0;
            nc.pageController.jumpToPage(0);
            nc.update();
          },
        ),
        actions: [
          GestureDetector(
            child: Image.asset(
              "assets/icons/questions.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
