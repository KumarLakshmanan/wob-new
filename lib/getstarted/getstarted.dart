import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/getstarted/helpers/otp.dart';
import 'package:wob/getstarted/helpers/phone.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../constants.dart';
import 'helpers/details.dart';
import 'helpers/dob.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController _pageController = PageController(initialPage: 0);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<String> yearsList = [];
  List<String> monthsList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<String> daysList = [];
  String selectedYear = DateTime.now().year.toString();
  String selectedMonth = 'Jan';
  String selectedDay = "01";

  @override
  void initState() {
    for (int i = DateTime.now().year; i >= 1920; i--) {
      yearsList.add(i.toString());
    }
    for (int i = 1; i <= 31; i++) {
      if (i.toString().length == 1) {
        daysList.add('0$i');
      } else {
        daysList.add(i.toString());
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_pageController.page!.round() == 0) {
          Get.back();
          return Future.value(true);
        } else {
          _pageController.previousPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
          return Future.value(false);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                if (_pageController.page!.round() == 0) {
                  Get.back();
                } else {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Get.isDarkMode
                    ? design.dark.bodyColor
                    : design.light.bodyColor,
                size: 20,
              ),
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Column(
            children: [
              KeyboardVisibilityBuilder(
                builder: (context, isKeyboardVisible) {
                  return Expanded(
                    child: isKeyboardVisible
                        ? const SizedBox.shrink()
                        : Image.asset(
                            "assets/images/bottle1.png",
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Get.isDarkMode
                        ? design.dark.background2
                        : design.light.background2,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 300,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        DateOfBirth(
                          daysList: daysList,
                          monthsList: monthsList,
                          yearsList: yearsList,
                          selectedDay: selectedDay,
                          selectedMonth: selectedMonth,
                          selectedYear: selectedYear,
                          onDayChanged: (value) {
                            setState(() {
                              selectedDay = value!;
                            });
                          },
                          onMonthChanged: (value) {
                            setState(() {
                              selectedMonth = value!;
                            });
                          },
                          onYearChanged: (value) {
                            setState(() {
                              selectedYear = value!;
                            });
                          },
                          pageController: _pageController,
                        ),
                        Details(
                          nameController: nameController,
                          emailController: emailController,
                          pageController: _pageController,
                        ),
                        Phone(
                          phoneController: phoneController,
                          pageController: _pageController,
                        ),
                        Otp(
                          phoneController: phoneController,
                          pageController: _pageController,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/clipper.png",
                    width: MediaQuery.of(context).size.width,
                    color: Get.isDarkMode
                        ? design.dark.background2
                        : design.light.background2,
                  ),
                  Positioned(
                    top: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Container(
                          width: 60,
                          height: 60,
                          child: const Icon(
                            Icons.arrow_right_alt_rounded,
                            color:Colors.white,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: Get.isDarkMode
                                ? design.dark.gradient
                                : design.light.gradient,
                                boxShadow: [
                          BoxShadow(
                            color: Get.isDarkMode
                                ? design.dark.gradient.colors[0].withOpacity(0.5)
                                : design.light.gradient.colors[0].withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                          ),
                        ),
                        heroTag: "arrow",
                        elevation: 0,
                        focusElevation: 0,
                        hoverElevation: 0,
                        highlightElevation: 0,
                        disabledElevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
