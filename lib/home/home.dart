import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/detect/detect.dart';
import 'package:wob/home/helpers/popular.dart';
import 'package:wob/painter/home_bubble.dart';
import 'package:wob/painter/home_cup.dart';
import 'package:wob/painters/radius.dart';
import 'package:wob/storeoffer/brandoffer.dart';
import 'package:wob/storeoffer/storeoffer.dart';
import 'package:wob/types/store_details.dart';
import 'package:wob/widgets/button.dart';

import 'helpers/carditem.dart';
import 'helpers/dialog.dart';
import 'helpers/myid.dart';
import 'helpers/cardoffers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nc = Get.find<NController>();
  final dc = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.home_rounded),
                const SizedBox(width: 5),
                const Text(
                  'Kalyannagar, Bangalore.',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  color: const Color(0xFF482D92),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Refer & Earn',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF3F1D7A).withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search brands, stores',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120 + (Get.width / 2.5),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF42247D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Use your coins to\nclaim a reward now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                MaterialButton(
                                  onPressed: () {},
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  color: const Color(0xFFFAAB1B),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Claim Reward',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 120 + ((Get.width / 2.5) / 2),
                  child: Container(
                    color: Colors.black,
                    height: 80,
                  ),
                ),
                Positioned(
                  right: -5,
                  left: 0,
                  top: 0,
                  child: Column(
                    children: [
                      const SizedBox(height: 120),
                      SizedBox(
                        height: Get.width / 2.5,
                        width: Get.width + 5,
                        child: Image.asset(
                          "assets/images/bubble_1.png",
                          width: Get.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    "assets/images/beercup.png",
                    height: Get.height * 0.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Exclusive\nWorld of Brands",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Gilroy',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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
