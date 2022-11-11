import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wob/constants.dart';
import 'package:wob/widgets/offer_card.dart';

class JackPot extends StatefulWidget {
  const JackPot({Key? key}) : super(key: key);

  @override
  State<JackPot> createState() => _JackPotState();
}

class _JackPotState extends State<JackPot> {
  final scrollController1 = ScrollController();
  final scrollController2 = ScrollController();
  final scrollController3 = ScrollController();

  double machineWidth = Get.width;
  double machineHeight = Get.width * 0.78;
  late double slotSize;
  late double slotGap;
  int totalSlot = 7;
  String labelText = "";
  bool isLoading = true;
  @override
  void initState() {
    slotSize = machineWidth * 0.11;
    slotGap = machineWidth * 0.08;
    animateListView();
    super.initState();
  }

  animateListView() {
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController1.animateTo(
        Random().nextInt(100) * (slotSize),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 2),
      );
      scrollController2.animateTo(
        Random().nextInt(100) * (slotSize),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 2),
      );
      scrollController3.animateTo(
        Random().nextInt(100) * (slotSize),
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 2),
      );
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF482D92),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "WOB INSIDER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Gilroy",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "exclusive offer on\nbrands just for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: design.light.primary,
                    fontSize: 24,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: machineHeight,
                  width: machineWidth,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            'assets/images/jackpot.png',
                            width: machineWidth,
                            height: machineHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        top: machineHeight * 0.5,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: machineWidth * 0.49,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: slotSize + 20,
                                  width: slotSize,
                                  child: ListWheelScrollView.useDelegate(
                                    itemExtent: slotSize,
                                    overAndUnderCenterOpacity: 0.5,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: scrollController1,
                                    childDelegate:
                                        ListWheelChildLoopingListDelegate(
                                      children: List<Widget>.generate(
                                        totalSlot,
                                        (index) => Image.asset(
                                          'assets/slots/' +
                                              (index + 1).toString() +
                                              '-removebg-preview.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: slotGap,
                                ),
                                SizedBox(
                                  height: slotSize + 20,
                                  width: slotSize,
                                  child: ListWheelScrollView.useDelegate(
                                    itemExtent: slotSize,
                                    overAndUnderCenterOpacity: 0.5,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: scrollController2,
                                    childDelegate:
                                        ListWheelChildLoopingListDelegate(
                                      children: List<Widget>.generate(
                                        totalSlot,
                                        (index) => Image.asset(
                                          'assets/slots/' +
                                              (index + 1).toString() +
                                              '-removebg-preview.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: slotGap,
                                ),
                                SizedBox(
                                  height: slotSize + 20,
                                  width: slotSize,
                                  child: ListWheelScrollView.useDelegate(
                                    itemExtent: slotSize,
                                    overAndUnderCenterOpacity: 0.5,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: scrollController3,
                                    childDelegate:
                                        ListWheelChildLoopingListDelegate(
                                      children: List<Widget>.generate(
                                        totalSlot,
                                        (index) => Image.asset(
                                          'assets/slots/' +
                                              (index + 1).toString() +
                                              '-removebg-preview.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: machineHeight * 0.32,
                        child: Center(
                          child: Text(
                            labelText,
                            style: TextStyle(
                              fontFamily: GoogleFonts.dotGothic16().fontFamily,
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: (machineHeight * 0.10) / 2,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            width: machineWidth * 0.3,
                            height: (machineHeight * 0.062),
                            child: MaterialButton(
                              elevation: 0,
                              focusElevation: 0,
                              hoverElevation: 0,
                              disabledElevation: 0,
                              highlightElevation: 0,
                              splashColor: Colors.transparent,
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  labelText = "Spinning";
                                });
                                double slot1Pexel =
                                    Random().nextInt(100) * (slotSize);
                                double slot2Pexel =
                                    Random().nextInt(100) * (slotSize);
                                double slot3Pexel =
                                    Random().nextInt(100) * (slotSize);
                                scrollController1.animateTo(
                                  slot1Pexel,
                                  duration: const Duration(seconds: 5),
                                  curve: Curves.easeInOut,
                                );
                                scrollController2.animateTo(
                                  slot2Pexel,
                                  duration: const Duration(seconds: 5),
                                  curve: Curves.easeInOut,
                                );
                                scrollController3.animateTo(
                                  slot3Pexel,
                                  duration: const Duration(seconds: 5),
                                  curve: Curves.easeInOut,
                                );
                                Future.delayed(const Duration(seconds: 5), () {
                                  if (slot1Pexel == slot2Pexel &&
                                      slot2Pexel == slot3Pexel) {
                                    setState(() {
                                      labelText = "Bingo!";
                                    });
                                  } else {
                                    setState(() {
                                      labelText = "Try Again";
                                    });
                                  }
                                });
                              },
                              child: Text(
                                'TAP TO SPIN',
                                style: TextStyle(
                                  color: design.light.textcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: OfferItemCard(
                    title: 'CHEERS\nCHEERS\nCHEERS',
                    subtitle: 'Beer O crat',
                    brandImg: "assets/images/budweiser.png",
                    background: "assets/images/offer.png",
                    claimOffer: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
