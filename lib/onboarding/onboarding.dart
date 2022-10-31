import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/getstarted/getstarted.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Get.isDarkMode
                  ? design.dark.textcolor
                  : design.light.textcolor,
              onPressed: () {
                Get.back();
              },
            ),
            top: MediaQuery.of(context).padding.top,
            left: 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      kToolbarHeight +
                      20,
                  left: 25,
                  right: 25,
                  bottom: 60,
                ),
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                  bottom: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 20),
                      blurRadius: 56,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/scan-offer-redeem.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Scan,\nOffers and Reedem',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Learn photography with the basics from 0 to master and get lots of promos and bonuses from learning',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                height: 1.5,
                                wordSpacing: 1.5,
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                Get.to(
                  const GetStarted(),
                  transition: Transition.rightToLeft,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/icons/next.png",
                    width: 30,
                    height: 30,
                    color: Get.isDarkMode
                        ? design.dark.textcolor
                        : design.light.textcolor,
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
