import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/detect/detect.dart';
import 'package:wob/home/home.dart';
import 'package:wob/notifications/notifications.dart';
import 'package:wob/offers/offers.dart';
import 'package:wob/painter/chevron.dart';
import 'package:wob/painters/circularnotch.dart';
import 'package:wob/qrscan/qrscan.dart';
import 'package:wob/settings/settings.dart';
import 'package:wob/types/store_details.dart';

import '../widgets/button.dart';

class MainScreen extends StatefulWidget {
  final StoreDetails? storeDetails;
  const MainScreen({
    Key? key,
    this.storeDetails,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final nc = Get.put(NController());
  final dc = Get.put(DataController());
  StreamSubscription<RangingResult>? _streamRanging;
  int emptyRequestsFromPrefs = 0;
  int emptyRequests = 0;
  int distanceRangeFromPrefs = 0;
  List<Beacon> beacons = [];
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          nc.currentPage = index;
        },
        controller: nc.pageController,
        children: const [
          Home(),
        ],
      ),
      bottomNavigationBar: GetBuilder(
        init: NController(),
        builder: (controller) {
          return Container(
            height: kBottomNavigationBarHeight + 10,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomPaint(
              painter: BottomBarCurve(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(width: 40),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/home.png",
                    ),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/scan.png",
                    ),
                    onPressed: () {
                     
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/alcoverse.png",
                    ),
                    onPressed: () {
                     
                    },
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          );
        },
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
