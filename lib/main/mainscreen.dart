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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/scan.png",
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        enableDrag: true,
                        isScrollControlled: true,
                        context: context,
                        isDismissible: true,
                        elevation: 10,
                        backgroundColor: Colors.white,
                        builder: (builder) {
                          return const WobBottomSheet();
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/alcoverse.png",
                    ),
                    onPressed: () {},
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

class WobBottomSheet extends StatefulWidget {
  const WobBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<WobBottomSheet> createState() => _WobBottomSheetState();
}

class _WobBottomSheetState extends State<WobBottomSheet> {
  @override
  Widget build(BuildContext context) {
    List<String> scrolls = [
      "29 offers claimed",
      "59000 points",
      "19 Rewards won",
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 25 + 20,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 5,
                        width: 125,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 25 + 20),
              Column(
                children: [
                  Image.asset(
                    "assets/images/avatar.png",
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "WOB INSIDER MEMBER SINCE July'22",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFFc9c9c9),
                    ),
                  ),
                  const Text(
                    "andrew james",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < scrolls.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFFF8F5),
                                  Color(0xFFFFE5D9),
                                ],
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Booking.png",
                                  height: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  scrolls[i],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF3A3E44),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Container(
                height: 255,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF482D92),
                      Color(0xFF622CAA),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/image.png",
                        width: 100,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF482D92),
                              Color(0xFF622CAA),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      bottom: 0,
                      left: -20,
                      top: 0,
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      bottom: 0,
                      right: -20,
                      top: 0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAAB1B),
                      borderRadius: BorderRadius.circular(
                        60,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Explore Benefits",
                          style: TextStyle(
                              color: Color(0xFF482482),
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF482482),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      const MainScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color(0xFFD9D9D9),
                  thickness: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      "settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF030D10),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      "past orders",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF030D10),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      "refer & earn",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF030D10),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      "support",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF030D10),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      "about",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF030D10),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
