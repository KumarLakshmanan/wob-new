import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/main/mainscreen.dart';
import 'package:wob/onboarding/welcome.dart';
import 'package:wob/widgets/button.dart';

import '../painters/sprite.dart';
import 'findbeacons.dart';

class Detect extends StatefulWidget {
  const Detect({Key? key}) : super(key: key);

  @override
  _DetectState createState() => _DetectState();
}

class _DetectState extends State<Detect> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool isBeaconsDetected = false;
  List<Beacon> beacons = [];
  final dc = Get.find<DataController>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller!.stop();
    _controller!.reset();
    _controller!.repeat(
      period: const Duration(seconds: 2),
    );
  }

  void setBeaconsDetected(List<Beacon> _beacons) {
    setState(() {
      isBeaconsDetected = _beacons.isNotEmpty;
      beacons = _beacons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Detect Store",
          style: TextStyle(
            color: Get.isDarkMode ? design.dark.textcolor : Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAll(const Welcome(), transition: Transition.leftToRight);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Get.isDarkMode ? design.dark.textcolor : Colors.white,
            size: 20,
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: CustomPaint(
              painter: SpritePainter(_controller!),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            ),
            alignment: Alignment.center,
          ),
          FindBeacons(
            setBeaconsDetected: setBeaconsDetected,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color:
                    Get.isDarkMode ? design.dark.primary : design.light.primary,
              ),
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Get.isDarkMode ? design.dark.secondary : Colors.white,
                ),
                width: 40,
                height: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (!isBeaconsDetected)
                  Text(
                    "Detecting Your Store",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Get.isDarkMode
                        ? design.dark.background2
                        : design.light.background2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!isBeaconsDetected)
                        Text(
                          "Lets identify the store to provide \nyou the best offers",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Get.isDarkMode
                                        ? design.dark.textcolor
                                        : design.light.textcolor,
                                  ),
                        ),
                      if (isBeaconsDetected)
                        MaterialBtn(
                          onPressed: () {
                            Get.offAll(
                              MainScreen(
                                storeDetails: dc.storeDetails.firstWhere(
                                    (element) =>
                                        element.uuid ==
                                        beacons[0].proximityUUID),
                              ),
                              transition: Transition.rightToLeft,
                            );
                          },
                          text: "Check In",
                          color: Get.isDarkMode
                              ? design.dark.secondary
                              : design.light.secondary,
                          margin: const EdgeInsets.only(),
                          isPrimary: true,
                          height: 50,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
