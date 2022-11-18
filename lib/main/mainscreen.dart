import 'dart:async';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/functions.dart';
import 'package:wob/home/home.dart';
import 'package:wob/painter/chevron.dart';
import 'package:wob/painter/round_slider_thumb.dart';
import 'package:wob/types/store_details.dart';

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
    loadData();
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DataController(),
        builder: (dccontroller) {
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
        });
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
    final dc = Get.put(DataController());
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
                height: 260,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/membership.png",
                            height: 75,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            child: Stack(
                              children: [
                                SliderTheme(
                                  data: SliderThemeData(
                                    trackShape: CustomTrackShape(),
                                    trackHeight: 4,
                                  ),
                                  child: Slider(
                                    value: 40,
                                    inactiveColor: const Color(0xFF3F1D7A),
                                    activeColor: const Color(0xFFFAAB1B),
                                    max: 100,
                                    onChanged: (double value) {},
                                  ),
                                ),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Text(
                                    "Shop for 3000 more to upgrade to gold",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 6,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final boxWidth = constraints.constrainWidth();
                              const dashWidth = 10.0;
                              final dashCount =
                                  (boxWidth / (1.5 * dashWidth)).floor();
                              return Flex(
                                children: List.generate(dashCount, (_) {
                                  return const SizedBox(
                                    width: dashWidth,
                                    height: 2,
                                    child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                    ),
                                  );
                                }),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                direction: Axis.horizontal,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          if (dc.userModule.runtimeType != Null)
                            Text(
                              dc.userModule!.firstname +
                                  " " +
                                  dc.userModule!.lastname,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    var bc = Barcode.code128();
                                    var svg = bc.toSvg(
                                      dc.userModule!.custid,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      height: 50,
                                      color: 0xFFFFFFFF,
                                      drawText: false,
                                      fontHeight: 10,
                                    );
                                    return SvgPicture.string(
                                      svg,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/sensor.png",
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      bottom: 0,
                      left: -25,
                      top: 0,
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      bottom: 0,
                      right: -25,
                      top: 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  onTap: () {},
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
        ],
      ),
    );
  }
}
